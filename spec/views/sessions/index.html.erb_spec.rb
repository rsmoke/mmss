require 'rails_helper'

RSpec.describe "sessions/index", type: :view do
  before(:each) do
    assign(:sessions, [
      Session.create!(
        :camp_configuration => nil,
        :description => "Description",
        :active => false
      ),
      Session.create!(
        :camp_configuration => nil,
        :description => "Description",
        :active => false
      )
    ])
  end

  it "renders a list of sessions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
