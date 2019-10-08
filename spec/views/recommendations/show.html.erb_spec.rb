require 'rails_helper'

RSpec.describe "recommendations/show", type: :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/State Non Us/)
    expect(rendered).to match(/Postalcode/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Best Contact Time/)
    expect(rendered).to match(/Submitted Recommendation/)
  end
end
