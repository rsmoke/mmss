require 'rails_helper'

RSpec.describe "course_assignments/show", type: :view do
  before(:each) do
    @course_assignment = assign(:course_assignment, CourseAssignment.create!(
      enrollment: nil,
      course: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
