require 'digest'
require 'time'

class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_current_enrollment

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
        camp_year: CampConfiguration.active_camp_year
      )
      redirect_to all_payments_path, notice: "Your Payment Was Successfully Recorded"
      if current_user.payments.current_camp_payments.where(transaction_status: 1).count == 1
        RegistrationMailer.app_complete_email(current_user).deliver_now
        @current_enrollment.update!(application_status: "submitted")
        if @current_enrollment.recommendation.recupload.present? 
          @current_enrollment.update!(application_status: "application complete")
        end
      else
        @finaids = @current_enrollment.financial_aids
        @finaids_ttl = @finaids.pluck(:amount_cents).sum
        @ttl_paid = current_user.payments.current_camp_payments.where(transaction_status: '1').pluck(:total_amount).map(&:to_i).sum      # cost_sessions = 1300 * @user_current_enrollment.session_registrations.size
        @total_cost = cost_sessions_ttl + cost_activities_ttl + CampConfiguration.active_camp_fee_cents
        @balance_due = @total_cost.to_i - @finaids_ttl.to_i - @ttl_paid.to_i
        if @balance_due == 0
          @current_enrollment.update!(application_status: "enrolled")
          # send enrollment complete email
          RegistrationMailer.app_enrolled_email(current_user).deliver_now
        end
      end
    end
  end

  def make_payment
    processed_url = generate_hash(params['amount'])
    redirect_to processed_url
  end

  def payment_show
    redirect_to root_url unless current_user.payments.current_camp_payments
    @registration_activities = @current_enrollment.registration_activities.order(camp_occurrence_id: :asc)
    @session_registrations = @current_enrollment.session_registrations.order(description: :asc)
    @has_any_session = @session_registrations.pluck(:description).include?("Any Session")
    @any_session_cost = CampOccurrence.find_by(description: "Any Session").cost_cents
    @current_application_status = @current_enrollment.application_status
    @finaids = @current_enrollment.financial_aids #need loop
    @finaids_ttl = @finaids.pluck(:amount_cents).sum
    @finaids_awarded_ttl = @finaids.where(status: "awarded").pluck(:amount_cents).sum
    @users_current_payments = current_user.payments.current_camp_payments
    @ttl_paid = current_user.payments.current_camp_payments.where(transaction_status: '1').pluck(:total_amount).map(&:to_i).sum
    @total_cost = cost_sessions_ttl + cost_activities_ttl + CampConfiguration.active_camp_fee_cents
    @balance_due = @total_cost.to_i - @finaids_awarded_ttl.to_i - @ttl_paid.to_i
  end

  private

    def set_current_enrollment
      @current_enrollment = current_user.enrollments.current_camp_year_applications.last
    end

    def generate_hash(amount = current_camp_fee / 100 )
      user_account = current_user.email.partition('@').first + '-' + current_user.id.to_s
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
      SessionAssignment.where(enrollment_id: @current_enrollment, offer_status: "accepted").pluck(:camp_occurrence_id)
    end

    def cost_sessions_ttl
      # sum of each session use is assigned to 
      CampOccurrence.where(id: assigned_sessions_ids).pluck(:cost_cents).sum
    end

    def cost_activities_ttl
      activity_ids = EnrollmentActivity.where(enrollment_id: @current_enrollment).pluck(:activity_id)
      Activity.where(id: activity_ids, camp_occurrence_id: assigned_sessions_ids).pluck(:cost_cents).sum
    end

    def url_params
      params.permit(:amount, :transactionType, :transactionStatus, :transactionId, :transactionTotalAmount, :transactionDate, :transactionAcountType, :transactionResultCode, :transactionResultMessage, :orderNumber, :timestamp, :hash, :camp_year)
    end
end
