class Course < ApplicationRecord
  belongs_to :camp_occurrence
  has_many :course_preferences
  has_many :course_assignments
  has_many :enrolled_users, through: :course_preferences, source: :enrollment


  scope :is_open, -> { where(status: "open") }
end
