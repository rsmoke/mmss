require 'rails_helper'

RSpec.describe "session_assignments/show", type: :view do
  before(:each) do
    @session_assignment = assign(:session_assignment, SessionAssignment.create!(
      enrollment: nil,
      camp_occurrence: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
