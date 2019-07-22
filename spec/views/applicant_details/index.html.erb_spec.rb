require 'rails_helper'

RSpec.describe "applicant_details/index", type: :view do
  before(:each) do
    assign(:applicant_details, [
      ApplicantDetail.create!(
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
      ),
      ApplicantDetail.create!(
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
      )
    ])
  end

  it "renders a list of applicant_details" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Middlename".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Demographic".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Shirt Size".to_s, :count => 2
    assert_select "tr>td", :text => "Address1".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "State Non Us".to_s, :count => 2
    assert_select "tr>td", :text => "Postalcode".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Parentname".to_s, :count => 2
    assert_select "tr>td", :text => "Parentaddress1".to_s, :count => 2
    assert_select "tr>td", :text => "Parentaddress2".to_s, :count => 2
    assert_select "tr>td", :text => "Parentcity".to_s, :count => 2
    assert_select "tr>td", :text => "Parentstate".to_s, :count => 2
    assert_select "tr>td", :text => "Parentstate Non Us".to_s, :count => 2
    assert_select "tr>td", :text => "Parentzip".to_s, :count => 2
    assert_select "tr>td", :text => "Parentcountry".to_s, :count => 2
    assert_select "tr>td", :text => "Parentphone".to_s, :count => 2
    assert_select "tr>td", :text => "Parentworkphone".to_s, :count => 2
    assert_select "tr>td", :text => "Parentemail".to_s, :count => 2
  end
end
