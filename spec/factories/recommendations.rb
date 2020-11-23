# == Schema Information
#
# Table name: recommendations
#
#  id                       :bigint           not null, primary key
#  enrollment_id            :bigint           not null
#  email                    :string           not null
#  lastname                 :string           not null
#  firstname                :string           not null
#  organization             :string
#  address1                 :string
#  address2                 :string
#  city                     :string
#  state                    :string
#  state_non_us             :string
#  postalcode               :string
#  country                  :string
#  phone_number             :string
#  best_contact_time        :string
#  submitted_recommendation :string
#  date_submitted           :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
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
