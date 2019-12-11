class Feedback < ApplicationRecord
  belongs_to :user

  validates :genre, presence: true
  validates :message, presence: true
end
