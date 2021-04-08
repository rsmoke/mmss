require 'rails_helper'

RSpec.describe "rejections/edit", type: :view do
  before(:each) do
    @rejection = assign(:rejection, Rejection.create!(
      enrollment: nil,
      reason: "MyText"
    ))
  end

  it "renders the edit rejection form" do
    render

    assert_select "form[action=?][method=?]", rejection_path(@rejection), "post" do

      assert_select "input[name=?]", "rejection[enrollment_id]"

      assert_select "textarea[name=?]", "rejection[reason]"
    end
  end
end
