require 'rails_helper'

RSpec.describe "applicant_details/show", type: :view do
  before(:each) do
    @applicant_detail = assign(:applicant_detail, ApplicantDetail.create!(
      :user => nil,
      :firstname => "Firstname",
      :middlename => "Middlename",
      :lastname => "Lastname",
      :gender => "Gender",
      :us_citizen => false,
      :demographic => "Demographic",
      :diet_restrictions => "MyText",
      :shirt_size => "Shirt Size",
      :address1 => "Address1",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :state_non_us => "State Non Us",
      :postalcode => "Postalcode",
      :country => "Country",
      :phone => "Phone",
      :parentname => "Parentname",
      :parentaddress1 => "Parentaddress1",
      :parentaddress2 => "Parentaddress2",
      :parentcity => "Parentcity",
      :parentstate => "Parentstate",
      :parentstate_non_us => "Parentstate Non Us",
      :parentzip => "Parentzip",
      :parentcountry => "Parentcountry",
      :parentphone => "Parentphone",
      :parentworkphone => "Parentworkphone",
      :parentemail => "Parentemail"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Middlename/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Demographic/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Shirt Size/)
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/State Non Us/)
    expect(rendered).to match(/Postalcode/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Parentname/)
    expect(rendered).to match(/Parentaddress1/)
    expect(rendered).to match(/Parentaddress2/)
    expect(rendered).to match(/Parentcity/)
    expect(rendered).to match(/Parentstate/)
    expect(rendered).to match(/Parentstate Non Us/)
    expect(rendered).to match(/Parentzip/)
    expect(rendered).to match(/Parentcountry/)
    expect(rendered).to match(/Parentphone/)
    expect(rendered).to match(/Parentworkphone/)
    expect(rendered).to match(/Parentemail/)
  end
end
