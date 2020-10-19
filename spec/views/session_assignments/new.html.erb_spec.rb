require 'rails_helper'

RSpec.describe "session_assignments/new", type: :view do
  before(:each) do
    assign(:session_assignment, SessionAssignment.new(
      enrollment: nil,
      camp_occurrence: nil
    ))
  end

  it "renders new session_assignment form" do
    render

    assert_select "form[action=?][method=?]", session_assignments_path, "post" do

      assert_select "input[name=?]", "session_assignment[enrollment_id]"

      assert_select "input[name=?]", "session_assignment[camp_occurrence_id]"
    end
  end
end
