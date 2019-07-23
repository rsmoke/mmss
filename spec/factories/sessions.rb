FactoryBot.define do
  factory :session do
    camp_configuration { nil }
    description { "MyString" }
    begin_date { "2019-07-23" }
    end_date { "2019-07-23" }
    active { false }
  end
end
