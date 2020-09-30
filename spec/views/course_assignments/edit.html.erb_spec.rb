require 'rails_helper'

RSpec.describe "course_assignments/edit", type: :view do
  before(:each) do
    @course_assignment = assign(:course_assignment, CourseAssignment.create!(
      enrollment: nil,
      course: nil
    ))
  end

  it "renders the edit course_assignment form" do
    render

    assert_select "form[action=?][method=?]", course_assignment_path(@course_assignment), "post" do

      assert_select "input[name=?]", "course_assignment[enrollment_id]"

      assert_select "input[name=?]", "course_assignment[course_id]"
    end
  end
end
