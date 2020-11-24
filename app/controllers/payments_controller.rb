  require 'digest'
  require 'time'

  class PaymentsController < ApplicationController
    # devise_group :logged_in, contains: [:user, :admin]
    # before_action :authenticate_logged_in!
    before_action :authenticate_user!

    def index
      redirect_to root_url
    end

    def payment_receipt
      if Payment.pluck(:transaction_id).include?(params['transactionId'])
        redirect_to all_payments_path
      else
        Payment.create(
          transaction_type: params['transactionType'],
          transaction_status: params['transactionStatus'],
          transaction_id: params['transactionId'],
          total_amount: params['transactionTotalAmount'],
          transaction_date: params['transactionDate'],
          account_type: params['transactionAcountType'],
          result_code: params['transactionResultCode'],
          result_message: params['transactionResultMessage'],
          user_account: params['orderNumber'],
          payer_identity: current_user.email,
          timestamp: params['timestamp'],
          transaction_hash: params['hash'],
          user_id: current_user.id,
          camp_year: current_camp_year
        )

        redirect_to all_payments_path, notice: "Your Payment Was Successfully Recorded"
        if current_user.payments.where(transaction_status: 1).count == 1
          RegistrationMailer.app_complete_email(current_user).deliver_now
          current_user.enrollments.last.update!(application_status: "submitted")
          enroll_id = Enrollment.find_by(user_id: current_user.id).id
          recom_id = Recommendation.find_by(enrollment_id: enroll_id).id
          if Recupload.find_by(recommendation_id: recom_id).present?
            current_user.enrollments.last.update!(application_status: "application complete")
          end
        else
          @user_current_enrollment = current_user.enrollments.last
          @finaids = FinancialAid.where(enrollment_id: @user_current_enrollment.id)
          @finaids_ttl = @finaids.pluck(:amount_cents).sum
          @ttl_paid = Payment.where(user_id: current_user, transaction_status: '1').pluck(:total_amount).map(&:to_i).sum      # cost_sessions = 1300 * @user_current_enrollment.session_registrations.size
          @total_cost = cost_sessions_ttl + cost_activities_ttl + CampConfiguration.active_camp_fee_cents
          @balance_due = @total_cost.to_i - @finaids_ttl.to_i - @ttl_paid.to_i
          if @balance_due == 0
            current_user.enrollments.last.update!(application_status: "enrolled")
          end
        end
      end
    end

    def make_payment
      processed_url = generate_hash(params['amount'])
      redirect_to processed_url
    end

    def payment_show

      redirect_to root_url unless current_user.payments
      @registration_activities = current_user.enrollments.last.registration_activities.order(camp_occurrence_id: :asc)
      @session_registrations = current_user.enrollments.last.session_registrations.order(description: :asc)
      @has_any_session = @session_registrations.pluck(:description).include?("Any Session")
      @any_session_cost = CampOccurrence.find_by(description: "Any Session").cost_cents
      @user_current_enrollment = current_user.enrollments.last
      @current_application_status = @user_current_enrollment.application_status
      @finaids = FinancialAid.where(enrollment_id: @user_current_enrollment.id) #need loop
      @finaids_ttl = @finaids.pluck(:amount_cents).sum
      @finaids_awarded_ttl = @finaids.where(status: "awarded").pluck(:amount_cents).sum
      @users_current_payments = Payment.where(user_id: current_user )
      @ttl_paid = Payment.where(user_id: current_user, transaction_status: '1').pluck(:total_amount).map(&:to_i).sum     # cost_sessions = 1300 * @user_current_enrollment.session_registrations.size
      @total_cost = cost_sessions_ttl + cost_activities_ttl + CampConfiguration.active_camp_fee_cents
      @balance_due = @total_cost.to_i - @finaids_awarded_ttl.to_i - @ttl_paid.to_i
    end

    private
      def generate_hash(amount=CampConfiguration.active_camp_fee_cents / 100 )
        user_account = current_user.email.partition('@').first + '-' + current_user.id.to_s
        # redirect_url = 'https://lsa-math-mmss.miserver.it.umich.edu/payment_receipt'
        amount_to_be_payed = amount.to_i
        if Rails.env.development? || Rails.application.credentials.NELNET_SERVICE[:SERVICE_SELECTOR] == "QA"
           key_to_use = 'test_key'
           url_to_use = 'test_URL'
         else
           key_to_use = 'prod_key'
           url_to_use = 'prod_URL'
         end

        connection_hash = {
         'test_key' => Rails.application.credentials.NELNET_SERVICE[:DEVELOPMENT_KEY],
         'test_URL' => Rails.application.credentials.NELNET_SERVICE[:DEVELOPMENT_URL],
         'prod_key' => Rails.application.credentials.NELNET_SERVICE[:PRODUCTION_KEY],
         'prod_URL' => Rails.application.credentials.NELNET_SERVICE[:PRODUCTION_URL]
        }

        redirect_url = connection_hash[url_to_use]
        current_epoch_time = DateTime.now.strftime("%Q").to_i
        initial_hash = {
          'orderNumber' => user_account,
          'orderType' => 'MMSS Univ of Michigan',
          'orderDescription' => 'MMSS Conference Fees',
          'amountDue' => amount_to_be_payed * 100,
          'redirectUrl' => redirect_url,
          'redirectUrlParameters' => 'transactionType,transactionStatus,transactionId,transactionTotalAmount,transactionDate,transactionAcountType,transactionResultCode,transactionResultMessage,orderNumber',
          # 'retriesAllowed' => 1,
          'timestamp' => current_epoch_time,
          'key' => connection_hash[key_to_use]
        }

        # Sample Hash Creation
        hash_to_be_encoded = initial_hash.values.map{|v| "#{v}"}.join('')
        encoded_hash =  Digest::SHA256.hexdigest hash_to_be_encoded

        # Final URL
        url_for_payment = initial_hash.map{|k,v| "#{k}=#{v}&" unless k == 'key'}.join('')
        final_url = connection_hash[url_to_use] + '?' + url_for_payment + 'hash=' + encoded_hash
      end

      def assigned_sessions_ids 
        SessionAssignment.where(enrollment_id: @user_current_enrollment, offer_status: "accepted").pluck(:camp_occurrence_id)
      end

      def cost_sessions_ttl
        # sum of each session use is assigned to 
        CampOccurrence.where(id: assigned_sessions_ids).pluck(:cost_cents).sum
      end

      def cost_activities_ttl
        activity_ids = EnrollmentActivity.where(enrollment_id: @user_current_enrollment).pluck(:activity_id)
        Activity.where(id: activity_ids, camp_occurrence_id: assigned_sessions_ids).pluck(:cost_cents).sum
      end

      def url_params
        params.permit(:amount, :transactionType, :transactionStatus, :transactionId, :transactionTotalAmount, :transactionDate, :transactionAcountType, :transactionResultCode, :transactionResultMessage, :orderNumber, :timestamp, :hash, :camp_year)
      end
  end
