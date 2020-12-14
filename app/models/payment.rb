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
  # include ApplicantState

  validates :transaction_id, presence: true, uniqueness: true
  validates :total_amount, presence: true

  belongs_to :user

  scope :current_camp_payments, -> { where('camp_year = ? ', CampConfiguration.active_camp_year) }

end
