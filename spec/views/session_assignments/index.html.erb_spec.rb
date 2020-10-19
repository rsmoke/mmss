require 'rails_helper'

RSpec.describe "session_assignments/index", type: :view do
  before(:each) do
    assign(:session_assignments, [
      SessionAssignment.create!(
        enrollment: nil,
        camp_occurrence: nil
      ),
      SessionAssignment.create!(
        enrollment: nil,
        camp_occurrence: nil
      )
    ])
  end

  it "renders a list of session_assignments" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
