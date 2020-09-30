require 'rails_helper'

RSpec.describe "course_assignments/index", type: :view do
  before(:each) do
    assign(:course_assignments, [
      CourseAssignment.create!(
        enrollment: nil,
        course: nil
      ),
      CourseAssignment.create!(
        enrollment: nil,
        course: nil
      )
    ])
  end

  it "renders a list of course_assignments" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
