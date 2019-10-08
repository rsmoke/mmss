require 'rails_helper'

RSpec.describe "recommendations/index", type: :view do
  before(:each) do
    assign(:recommendations, [
      Recommendation.create!(
        :enrollment => nil,
        :email => "Email",
        :lastname => "Lastname",
        :firstname => "Firstname",
        :organization => "Organization",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :state_non_us => "State Non Us",
        :postalcode => "Postalcode",
        :country => "Country",
        :phone_number => "Phone Number",
        :best_contact_time => "Best Contact Time",
        :submitted_recommendation => "Submitted Recommendation"
      ),
      Recommendation.create!(
        :enrollment => nil,
        :email => "Email",
        :lastname => "Lastname",
        :firstname => "Firstname",
        :organization => "Organization",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :state_non_us => "State Non Us",
        :postalcode => "Postalcode",
        :country => "Country",
        :phone_number => "Phone Number",
        :best_contact_time => "Best Contact Time",
        :submitted_recommendation => "Submitted Recommendation"
      )
    ])
  end

  it "renders a list of recommendations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Organization".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "State Non Us".to_s, :count => 2
    assert_select "tr>td", :text => "Postalcode".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Best Contact Time".to_s, :count => 2
    assert_select "tr>td", :text => "Submitted Recommendation".to_s, :count => 2
  end
end
