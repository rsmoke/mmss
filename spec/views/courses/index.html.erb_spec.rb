require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        :camp_occurrence => nil,
        :title => "Title",
        :available_spaces => 2,
        :status => "Status"
      ),
      Course.create!(
        :camp_occurrence => nil,
        :title => "Title",
        :available_spaces => 2,
        :status => "Status"
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
