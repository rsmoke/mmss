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
class Feedback < ApplicationRecord
  belongs_to :user

  validates :genre, presence: true
  validates :message, presence: true
end
