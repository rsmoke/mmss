FactoryBot.define do
  factory :course do
    camp_occurrence { nil }
    title { "MyString" }
    available_spaces { 1 }
    status { "MyString" }
  end
end
