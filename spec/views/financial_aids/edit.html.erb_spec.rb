require 'rails_helper'

RSpec.describe "financial_aids/edit", type: :view do
  before(:each) do
    @financial_aid = assign(:financial_aid, FinancialAid.create!(
      :enrollment => nil,
      :amount_cents => 1,
      :source => "MyString",
      :awarded => false,
      :note => "MyText",
      :status => "MyString"
    ))
  end

  it "renders the edit financial_aid form" do
    render

    assert_select "form[action=?][method=?]", financial_aid_path(@financial_aid), "post" do

      assert_select "input[name=?]", "financial_aid[enrollment_id]"

      assert_select "input[name=?]", "financial_aid[amount_cents]"

      assert_select "input[name=?]", "financial_aid[source]"

      assert_select "input[name=?]", "financial_aid[awarded]"

      assert_select "textarea[name=?]", "financial_aid[note]"

      assert_select "input[name=?]", "financial_aid[status]"
    end
  end
end
