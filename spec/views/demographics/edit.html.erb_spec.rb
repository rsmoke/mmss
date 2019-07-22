require 'rails_helper'

RSpec.describe "demographics/edit", type: :view do
  before(:each) do
    @demographic = assign(:demographic, Demographic.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit demographic form" do
    render

    assert_select "form[action=?][method=?]", demographic_path(@demographic), "post" do

      assert_select "input[name=?]", "demographic[name]"

      assert_select "input[name=?]", "demographic[description]"
    end
  end
end
