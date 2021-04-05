require 'rails_helper'

RSpec.describe "rejections/new", type: :view do
  before(:each) do
    assign(:rejection, Rejection.new(
      enrollment: nil,
      reason: "MyText"
    ))
  end

  it "renders new rejection form" do
    render

    assert_select "form[action=?][method=?]", rejections_path, "post" do

      assert_select "input[name=?]", "rejection[enrollment_id]"

      assert_select "textarea[name=?]", "rejection[reason]"
    end
  end
end
