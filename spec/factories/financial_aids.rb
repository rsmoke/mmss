FactoryBot.define do
  factory :financial_aid do
    enrollment { nil }
    amount_cents { 1 }
    source { "MyString" }
    awarded { false }
    note { "MyText" }
    status { "MyString" }
  end
end
