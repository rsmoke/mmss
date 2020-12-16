# == Schema Information
#
# Table name: payments
#
#  id                 :bigint           not null, primary key
#  transaction_type   :string
#  transaction_status :string
#  transaction_id     :string
#  total_amount       :string
#  transaction_date   :string
#  account_type       :string
#  result_code        :string
#  result_message     :string
#  user_account       :string
#  payer_identity     :string
#  timestamp          :string
#  transaction_hash   :string
#  user_id            :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  camp_year          :integer
#
class Payment < ApplicationRecord
  include ApplicantState
  before_save :set_current_enrollment
  after_commit :send_enrolled_letter, if: :persisted?

  validates :transaction_id, presence: true, uniqueness: true
  validates :total_amount, presence: true

  belongs_to :user

  scope :current_camp_payments, -> { where('camp_year = ? ', CampConfiguration.active_camp_year) }

  private

  def set_current_enrollment
    @current_enrollment = self.user.enrollments.current_camp_year_applications.last
  end

  def send_enrolled_letter
    if balance_due == 0 && @current_enrollment.student_packet.attached?
      @current_enrollment.update!(application_status: "enrolled")
      # send enrollment complete email
      RegistrationMailer.app_enrolled_email(self.user).deliver_now
    end
  end
end
