require 'rails_helper'

RSpec.describe "genders/edit", type: :view do
  before(:each) do
    @gender = assign(:gender, Gender.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit gender form" do
    render

    assert_select "form[action=?][method=?]", gender_path(@gender), "post" do

      assert_select "input[name=?]", "gender[name]"

      assert_select "input[name=?]", "gender[description]"
    end
  end
end
