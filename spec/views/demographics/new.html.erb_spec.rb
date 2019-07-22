require 'rails_helper'

RSpec.describe "demographics/new", type: :view do
  before(:each) do
    assign(:demographic, Demographic.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new demographic form" do
    render

    assert_select "form[action=?][method=?]", demographics_path, "post" do

      assert_select "input[name=?]", "demographic[name]"

      assert_select "input[name=?]", "demographic[description]"
    end
  end
end
