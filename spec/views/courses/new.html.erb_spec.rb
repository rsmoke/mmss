require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      :camp_occurrence => nil,
      :title => "MyString",
      :available_spaces => 1,
      :status => "MyString"
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input[name=?]", "course[camp_occurrence_id]"

      assert_select "input[name=?]", "course[title]"

      assert_select "input[name=?]", "course[available_spaces]"

      assert_select "input[name=?]", "course[status]"
    end
  end
end
