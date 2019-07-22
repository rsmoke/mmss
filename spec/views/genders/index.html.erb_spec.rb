require 'rails_helper'

RSpec.describe "genders/index", type: :view do
  before(:each) do
    assign(:genders, [
      Gender.create!(
        :name => "Name",
        :description => "Description"
      ),
      Gender.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of genders" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
