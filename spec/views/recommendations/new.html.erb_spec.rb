require 'rails_helper'

RSpec.describe "recommendations/new", type: :view do
  before(:each) do
    assign(:recommendation, Recommendation.new(
      :enrollment => nil,
      :email => "MyString",
      :lastname => "MyString",
      :firstname => "MyString",
      :organization => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :state_non_us => "MyString",
      :postalcode => "MyString",
      :country => "MyString",
      :phone_number => "MyString",
      :best_contact_time => "MyString",
      :submitted_recommendation => "MyString"
    ))
  end

  it "renders new recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendations_path, "post" do

      assert_select "input[name=?]", "recommendation[enrollment_id]"

      assert_select "input[name=?]", "recommendation[email]"

      assert_select "input[name=?]", "recommendation[lastname]"

      assert_select "input[name=?]", "recommendation[firstname]"

      assert_select "input[name=?]", "recommendation[organization]"

      assert_select "input[name=?]", "recommendation[address1]"

      assert_select "input[name=?]", "recommendation[address2]"

      assert_select "input[name=?]", "recommendation[city]"

      assert_select "input[name=?]", "recommendation[state]"

      assert_select "input[name=?]", "recommendation[state_non_us]"

      assert_select "input[name=?]", "recommendation[postalcode]"

      assert_select "input[name=?]", "recommendation[country]"

      assert_select "input[name=?]", "recommendation[phone_number]"

      assert_select "input[name=?]", "recommendation[best_contact_time]"

      assert_select "input[name=?]", "recommendation[submitted_recommendation]"
    end
  end
end
