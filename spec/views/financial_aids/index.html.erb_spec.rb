require 'rails_helper'

RSpec.describe "financial_aids/index", type: :view do
  before(:each) do
    assign(:financial_aids, [
      FinancialAid.create!(
        :enrollment => nil,
        :amount_cents => 2,
        :source => "Source",
        :awarded => false,
        :note => "MyText",
        :status => "Status"
      ),
      FinancialAid.create!(
        :enrollment => nil,
        :amount_cents => 2,
        :source => "Source",
        :awarded => false,
        :note => "MyText",
        :status => "Status"
      )
    ])
  end

  it "renders a list of financial_aids" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
