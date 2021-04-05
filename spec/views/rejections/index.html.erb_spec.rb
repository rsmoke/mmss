require 'rails_helper'

RSpec.describe "rejections/index", type: :view do
  before(:each) do
    assign(:rejections, [
      Rejection.create!(
        enrollment: nil,
        reason: "MyText"
      ),
      Rejection.create!(
        enrollment: nil,
        reason: "MyText"
      )
    ])
  end

  it "renders a list of rejections" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
