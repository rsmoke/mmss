require 'rails_helper'

RSpec.describe "demographics/index", type: :view do
  before(:each) do
    assign(:demographics, [
      Demographic.create!(
        :name => "Name",
        :description => "Description"
      ),
      Demographic.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of demographics" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
