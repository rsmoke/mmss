FactoryBot.define do
  factory :enrollment do
    user
    # international { false }
    high_school_name { "Academy of Smartness" }
    high_school_address1 { "345 Main Street" }
    # high_school_address2 { "MyString" }
    high_school_city { "Saline" }
    # high_school_state { "MyString" }
    # high_school_non_us { "MyString" }
    # high_school_postalcode { "MyString" }
    high_school_country { "US" }
    year_in_school { "Junior" }
    anticipated_graduation_year { "2018" }
    # room_mate_request { "MyString" }
    personal_statement { "I was born in a shed" }
    # shirt_size { "MyString" }
    # notes { "MyText" }
    # application_status { "MyString" }
    # offer_status { "MyString" }
    # partner_program { "MyString" }
  end
end
