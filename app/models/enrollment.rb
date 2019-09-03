class Enrollment < ApplicationRecord
  belongs_to :user
  has_many :enrollment_activities
  has_many :activities, through: :enrollment_activities
end
