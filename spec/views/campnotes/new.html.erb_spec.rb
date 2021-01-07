require 'rails_helper'

RSpec.describe "campnotes/new", type: :view do
  before(:each) do
    assign(:campnote, Campnote.new(
      note: "MyString",
      notetype: "MyString"
    ))
  end

  it "renders new campnote form" do
    render

    assert_select "form[action=?][method=?]", campnotes_path, "post" do

      assert_select "input[name=?]", "campnote[note]"

      assert_select "input[name=?]", "campnote[notetype]"
    end
  end
end
