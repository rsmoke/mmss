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
          user_id: current_user.id
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
          @finaids_ttl = @finaids.pluck(:amount_cents).map(&:to_f).sum / 100
          @ttl_paid = Payment.where(user_id: current_user, transaction_status: '1').pluck(:total_amount).map(&:to_f).sum / 100      # cost_sessions = 1300 * @user_current_enrollment.session_registrations.size
          cost_activities = @user_current_enrollment.registration_activities.pluck(:cost_cents).map(&:to_f).sum / 100
          @total_cost = cost_sessions_ttl + cost_activities + 100
          @balance_due = @total_cost - @finaids_ttl - @ttl_paid
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
      @finaids = FinancialAid.where(enrollment_id: @user_current_enrollment.id)
      @finaids_ttl = @finaids.pluck(:amount_cents).map(&:to_f).sum / 100
      @users_current_payments = Payment.where(user_id: current_user )
      @ttl_paid = Payment.where(user_id: current_user, transaction_status: '1').pluck(:total_amount).map(&:to_f).sum / 100      # cost_sessions = 1300 * @user_current_enrollment.session_registrations.size
      cost_activities = @user_current_enrollment.registration_activities.pluck(:cost_cents).map(&:to_f).sum / 100
      @total_cost = cost_sessions_ttl + cost_activities + 100
      @balance_due = @total_cost - @finaids_ttl - @ttl_paid
    end

    private
      def generate_hash(amount=100)
        user_account = current_user.email.partition('@').first + '-' + current_user.id.to_s
        redirect_url = 'https://lsa-math-mmss.miserver.it.umich.edu/payment_receipt'
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
        current_epoch_time = DateTime.now.strftime("%Q").to_i
        initial_hash = {
          'orderNumber' => user_account,
          'orderType' => 'MMSS Univ of Michigan',
          'orderDescription' => 'MMSS Conference Fees',
          'amountDue' => amount_to_be_payed * 100,
          'redirectUrl' => redirect_url,
          'redirectUrlParameters' => 'transactionType,transactionStatus,transactionId,transactionTotalAmount,transactionDate,transactionAcountType,transactionResultCode,transactionResultMessage,orderNumber',
          'retriesAllowed' => 1,
          'timestamp' => current_epoch_time,
          'key' => connection_hash[key_to_use]
        }

        # Sample Hash Creation
        hash_to_be_encoded = initial_hash.values.map{|v| "#{v}"}.join('')
        encoded_hash =  Digest::SHA256.hexdigest hash_to_be_encoded

        # Final URL
        url_for_payment = initial_hash.map{|k,v| "#{k}=#{v}&" unless k == 'key'}.join('')
        final_url = connection_hash[url_to_use] + url_for_payment + 'hash=' + encoded_hash
      end

      def cost_sessions_ttl
        if @user_current_enrollment.session_registrations.pluck(:description).include?("Any Session")
          1300
        else
          1300 * @user_current_enrollment.session_registrations.size
        end
      end

      def url_params
        params.permit(:amount, :transactionType, :transactionStatus, :transactionId, :transactionTotalAmount, :transactionDate, :transactionAcountType, :transactionResultCode, :transactionResultMessage, :orderNumber, :timestamp, :hash)
      end
  end
