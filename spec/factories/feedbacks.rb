# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  genre      :string           not null
#  message    :string           not null
#
FactoryBot.define do
  factory :feedback do
    
  end
end
