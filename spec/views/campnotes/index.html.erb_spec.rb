require 'rails_helper'

RSpec.describe "campnotes/index", type: :view do
  before(:each) do
    assign(:campnotes, [
      Campnote.create!(
        note: "Note",
        notetype: "Notetype"
      ),
      Campnote.create!(
        note: "Note",
        notetype: "Notetype"
      )
    ])
  end

  it "renders a list of campnotes" do
    render
    assert_select "tr>td", text: "Note".to_s, count: 2
    assert_select "tr>td", text: "Notetype".to_s, count: 2
  end
end
