FactoryBot.define do
  factory :applicant_detail do
    user { nil }
    firstname { "MyString" }
    middlename { "MyString" }
    lastname { "MyString" }
    gender { "MyString" }
    us_citizen { false }
    demographic { "MyString" }
    birthdate { "2019-07-22" }
    diet_restrictions { "MyText" }
    shirt_size { "MyString" }
    address1 { "MyString" }
    address2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    state_non_us { "MyString" }
    postalcode { "MyString" }
    country { "MyString" }
    phone { "MyString" }
    parentname { "MyString" }
    parentaddress1 { "MyString" }
    parentaddress2 { "MyString" }
    parentcity { "MyString" }
    parentstate { "MyString" }
    parentstate_non_us { "MyString" }
    parentzip { "MyString" }
    parentcountry { "MyString" }
    parentphone { "MyString" }
    parentworkphone { "MyString" }
    parentemail { "MyString" }
  end
end
