require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      :camp_occurrence => nil,
      :title => "MyString",
      :available_spaces => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input[name=?]", "course[camp_occurrence_id]"

      assert_select "input[name=?]", "course[title]"

      assert_select "input[name=?]", "course[available_spaces]"

      assert_select "input[name=?]", "course[status]"
    end
  end
end
