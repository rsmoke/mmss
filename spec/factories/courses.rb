# == Schema Information
#
# Table name: courses
#
#  id                 :bigint           not null, primary key
#  camp_occurrence_id :bigint           not null
#  title              :string
#  available_spaces   :integer
#  status             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :course do
    camp_occurrence { nil }
    title { "MyString" }
    available_spaces { 1 }
    status { "MyString" }
  end
end
