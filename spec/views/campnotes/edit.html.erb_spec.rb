require 'rails_helper'

RSpec.describe "campnotes/edit", type: :view do
  before(:each) do
    @campnote = assign(:campnote, Campnote.create!(
      note: "MyString",
      notetype: "MyString"
    ))
  end

  it "renders the edit campnote form" do
    render

    assert_select "form[action=?][method=?]", campnote_path(@campnote), "post" do

      assert_select "input[name=?]", "campnote[note]"

      assert_select "input[name=?]", "campnote[notetype]"
    end
  end
end
