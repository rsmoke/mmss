require 'rails_helper'

RSpec.describe "travels/index", type: :view do
  before(:each) do
    assign(:travels, [
      Travel.create!(
        :enrollment => nil,
        :direction => "Direction",
        :transport_needed => "Transport Needed",
        :mode => "Mode",
        :carrier => "Carrier",
        :route_num => "Route Num",
        :note => "MyText"
      ),
      Travel.create!(
        :enrollment => nil,
        :direction => "Direction",
        :transport_needed => "Transport Needed",
        :mode => "Mode",
        :carrier => "Carrier",
        :route_num => "Route Num",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of travels" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Direction".to_s, :count => 2
    assert_select "tr>td", :text => "Transport Needed".to_s, :count => 2
    assert_select "tr>td", :text => "Mode".to_s, :count => 2
    assert_select "tr>td", :text => "Carrier".to_s, :count => 2
    assert_select "tr>td", :text => "Route Num".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
