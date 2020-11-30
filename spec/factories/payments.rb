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
FactoryBot.define do
  factory :payment do
    transaction_type { "MyString" }
    transaction_status { "MyString" }
    transaction_id { "MyString" }
    total_amount { "MyString" }
    transaction_date { "MyString" }
    account_type { "MyString" }
    result_code { "MyString" }
    result_message { "MyString" }
    user_accoun { "MyString" }
    payer_identity { "MyString" }
    timestamp { "MyString" }
    transaction_hash { "MyString" }
    user { nil }
  end
end
