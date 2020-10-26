# == Schema Information
#
# Table name: recuploads
#
#  id                :bigint           not null, primary key
#  letter            :text
#  authorname        :string           not null
#  studentname       :string           not null
#  recommendation_id :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :recupload do
    letter { "MyText" }
    authorname { "MyString" }
    studentname { "MyString" }
    recommendation { nil }
  end
end
