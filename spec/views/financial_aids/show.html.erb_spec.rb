require 'rails_helper'

RSpec.describe "financial_aids/show", type: :view do
  before(:each) do
    @financial_aid = assign(:financial_aid, FinancialAid.create!(
      :enrollment => nil,
      :amount_cents => 2,
      :source => "Source",
      :awarded => false,
      :note => "MyText",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Source/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
  end
end
