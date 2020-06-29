class CoursePreference < ApplicationRecord
  belongs_to :enrollment
  belongs_to :course

  def course_title
    Course.find(self.course_id).title
  end
end
