require 'rails_helper'

RSpec.describe "course_assignments/new", type: :view do
  before(:each) do
    assign(:course_assignment, CourseAssignment.new(
      enrollment: nil,
      course: nil
    ))
  end

  it "renders new course_assignment form" do
    render

    assert_select "form[action=?][method=?]", course_assignments_path, "post" do

      assert_select "input[name=?]", "course_assignment[enrollment_id]"

      assert_select "input[name=?]", "course_assignment[course_id]"
    end
  end
end
