class CourseAssignment < ApplicationRecord
  belongs_to :enrollment
  belongs_to :course
end
