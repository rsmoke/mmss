require 'rails_helper'

RSpec.describe "campnotes/show", type: :view do
  before(:each) do
    @campnote = assign(:campnote, Campnote.create!(
      note: "Note",
      notetype: "Notetype"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Note/)
    expect(rendered).to match(/Notetype/)
  end
end
