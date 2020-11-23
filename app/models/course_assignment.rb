# == Schema Information
#
# Table name: course_assignments
#
#  id            :bigint           not null, primary key
#  enrollment_id :bigint           not null
#  course_id     :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CourseAssignment < ApplicationRecord
  belongs_to :enrollment
  belongs_to :course


  scope :number_of_assignments, ->(course_id="") {where(course_id: course_id).size}

end
