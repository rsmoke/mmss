require 'rails_helper'

RSpec.describe "session_assignments/edit", type: :view do
  before(:each) do
    @session_assignment = assign(:session_assignment, SessionAssignment.create!(
      enrollment: nil,
      camp_occurrence: nil
    ))
  end

  it "renders the edit session_assignment form" do
    render

    assert_select "form[action=?][method=?]", session_assignment_path(@session_assignment), "post" do

      assert_select "input[name=?]", "session_assignment[enrollment_id]"

      assert_select "input[name=?]", "session_assignment[camp_occurrence_id]"
    end
  end
end
