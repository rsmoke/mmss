require 'rails_helper'

RSpec.describe "applicant_details/edit", type: :view do
  before(:each) do
    @applicant_detail = assign(:applicant_detail, ApplicantDetail.create!(
      :user => nil,
      :firstname => "MyString",
      :middlename => "MyString",
      :lastname => "MyString",
      :gender => "MyString",
      :us_citizen => false,
      :demographic => "MyString",
      :diet_restrictions => "MyText",
      :shirt_size => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :state_non_us => "MyString",
      :postalcode => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :parentname => "MyString",
      :parentaddress1 => "MyString",
      :parentaddress2 => "MyString",
      :parentcity => "MyString",
      :parentstate => "MyString",
      :parentstate_non_us => "MyString",
      :parentzip => "MyString",
      :parentcountry => "MyString",
      :parentphone => "MyString",
      :parentworkphone => "MyString",
      :parentemail => "MyString"
    ))
  end

  it "renders the edit applicant_detail form" do
    render

    assert_select "form[action=?][method=?]", applicant_detail_path(@applicant_detail), "post" do

      assert_select "input[name=?]", "applicant_detail[user_id]"

      assert_select "input[name=?]", "applicant_detail[firstname]"

      assert_select "input[name=?]", "applicant_detail[middlename]"

      assert_select "input[name=?]", "applicant_detail[lastname]"

      assert_select "input[name=?]", "applicant_detail[gender]"

      assert_select "input[name=?]", "applicant_detail[us_citizen]"

      assert_select "input[name=?]", "applicant_detail[demographic]"

      assert_select "textarea[name=?]", "applicant_detail[diet_restrictions]"

      assert_select "input[name=?]", "applicant_detail[shirt_size]"

      assert_select "input[name=?]", "applicant_detail[address1]"

      assert_select "input[name=?]", "applicant_detail[address2]"

      assert_select "input[name=?]", "applicant_detail[city]"

      assert_select "input[name=?]", "applicant_detail[state]"

      assert_select "input[name=?]", "applicant_detail[state_non_us]"

      assert_select "input[name=?]", "applicant_detail[postalcode]"

      assert_select "input[name=?]", "applicant_detail[country]"

      assert_select "input[name=?]", "applicant_detail[phone]"

      assert_select "input[name=?]", "applicant_detail[parentname]"

      assert_select "input[name=?]", "applicant_detail[parentaddress1]"

      assert_select "input[name=?]", "applicant_detail[parentaddress2]"

      assert_select "input[name=?]", "applicant_detail[parentcity]"

      assert_select "input[name=?]", "applicant_detail[parentstate]"

      assert_select "input[name=?]", "applicant_detail[parentstate_non_us]"

      assert_select "input[name=?]", "applicant_detail[parentzip]"

      assert_select "input[name=?]", "applicant_detail[parentcountry]"

      assert_select "input[name=?]", "applicant_detail[parentphone]"

      assert_select "input[name=?]", "applicant_detail[parentworkphone]"

      assert_select "input[name=?]", "applicant_detail[parentemail]"
    end
  end
end
