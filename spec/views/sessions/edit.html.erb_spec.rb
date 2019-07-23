require 'rails_helper'

RSpec.describe "sessions/edit", type: :view do
  before(:each) do
    @session = assign(:session, Session.create!(
      :camp_configuration => nil,
      :description => "MyString",
      :active => false
    ))
  end

  it "renders the edit session form" do
    render

    assert_select "form[action=?][method=?]", session_path(@session), "post" do

      assert_select "input[name=?]", "session[camp_configuration_id]"

      assert_select "input[name=?]", "session[description]"

      assert_select "input[name=?]", "session[active]"
    end
  end
end
