require 'rails_helper'

RSpec.describe "rejections/show", type: :view do
  before(:each) do
    @rejection = assign(:rejection, Rejection.create!(
      enrollment: nil,
      reason: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
