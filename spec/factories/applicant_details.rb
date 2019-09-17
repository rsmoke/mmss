FactoryBot.define do
  factory :applicant_detail do
    user
    firstname { "Chester" }
    # middlename { "The" }
    lastname { "Tester" }
    gender { "Male" }
    us_citizen { true }
    demographic { "MyString" }
    birthdate { "2019-07-22" }
    diet_restrictions { "peanuts" }
    shirt_size { "Large" }
    address1 { "123 Main Street" }
    # address2 { "MyString" }
    city { "Saline" }
    # state { "MyString" }
    # state_non_us { "MyString" }
    postalcode { "48896" }
    country { "US" }
    phone { "1234567890" }
    parentname { "Cheryl Stooge" }
    parentaddress1 { "123 Main Street" }
    # parentaddress2 { "MyString" }
    parentcity { "Saline" }
    # parentstate { "MyString" }
    # parentstate_non_us { "MyString" }
    parentzip { "48896" }
    parentcountry { "US" }
    parentphone { "9876543217" }
    # parentworkphone { "MyString" }
    parentemail { "cheryl.tester@tester.com" }
  end
end
