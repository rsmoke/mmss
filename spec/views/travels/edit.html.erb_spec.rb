require 'rails_helper'

RSpec.describe "travels/edit", type: :view do
  before(:each) do
    @travel = assign(:travel, Travel.create!(
      :enrollment => nil,
      :direction => "MyString",
      :transport_needed => "MyString",
      :mode => "MyString",
      :carrier => "MyString",
      :route_num => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit travel form" do
    render

    assert_select "form[action=?][method=?]", travel_path(@travel), "post" do

      assert_select "input[name=?]", "travel[enrollment_id]"

      assert_select "input[name=?]", "travel[direction]"

      assert_select "input[name=?]", "travel[transport_needed]"

      assert_select "input[name=?]", "travel[mode]"

      assert_select "input[name=?]", "travel[carrier]"

      assert_select "input[name=?]", "travel[route_num]"

      assert_select "textarea[name=?]", "travel[note]"
    end
  end
end
