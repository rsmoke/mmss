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
