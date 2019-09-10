FactoryBot.define do
  factory :activity do
    session { nil }
    description { "MyString" }
    cost_cents { 20000 }
    date_occurs { "2019-07-23" }
    active { false }
  end
end
