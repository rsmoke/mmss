FactoryBot.define do
  factory :enrollment do
    user { nil }
    international { false }
    high_school_name { "MyString" }
    high_school_address1 { "MyString" }
    high_school_address2 { "MyString" }
    high_school_city { "MyString" }
    high_school_state { "MyString" }
    high_school_non_us { "MyString" }
    high_school_postalcode { "MyString" }
    high_school_country { "MyString" }
    year_in_school { "MyString" }
    anticipated_graduation_year { "MyString" }
    room_mate_request { "MyString" }
    personal_statement { "MyText" }
    shirt_size { "MyString" }
    notes { "MyText" }
    application_status { "MyString" }
    offer_status { "MyString" }
    partner_program { "MyString" }
  end
end
