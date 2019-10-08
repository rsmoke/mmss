FactoryBot.define do
  factory :recommendation do
    enrollment { nil }
    email { "MyString" }
    lastname { "MyString" }
    firstname { "MyString" }
    organization { "MyString" }
    address1 { "MyString" }
    address2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    state_non_us { "MyString" }
    postalcode { "MyString" }
    country { "MyString" }
    phone_number { "MyString" }
    best_contact_time { "MyString" }
    submitted_recommendation { "MyString" }
    date_submitted { "2019-10-08 11:25:04" }
  end
end
