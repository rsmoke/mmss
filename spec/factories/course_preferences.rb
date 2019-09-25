FactoryBot.define do
  factory :course_preference do
    enrollment { nil }
    course { nil }
    ranking { 1 }
  end
end
