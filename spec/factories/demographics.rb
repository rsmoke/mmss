# == Schema Information
#
# Table name: demographics
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :demographic do
    name { "MyString" }
    description { "MyString" }
  end
end
