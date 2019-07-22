require 'rails_helper'

RSpec.describe "demographics/show", type: :view do
  before(:each) do
    @demographic = assign(:demographic, Demographic.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
