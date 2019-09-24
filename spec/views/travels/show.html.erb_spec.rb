require 'rails_helper'

RSpec.describe "travels/show", type: :view do
  before(:each) do
    @travel = assign(:travel, Travel.create!(
      :enrollment => nil,
      :direction => "Direction",
      :transport_needed => "Transport Needed",
      :mode => "Mode",
      :carrier => "Carrier",
      :route_num => "Route Num",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Direction/)
    expect(rendered).to match(/Transport Needed/)
    expect(rendered).to match(/Mode/)
    expect(rendered).to match(/Carrier/)
    expect(rendered).to match(/Route Num/)
    expect(rendered).to match(/MyText/)
  end
end
