class Course < ApplicationRecord
  belongs_to :camp_occurrence
  has_many :course_preferences
  has_many :enrollments, through: :course_preferences
end
