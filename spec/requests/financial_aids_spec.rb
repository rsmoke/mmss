require 'rails_helper'

RSpec.describe "FinancialAids", type: :request do
  describe "GET /financial_aids" do
    it "works! (now write some real specs)" do
      get financial_aids_path
      expect(response).to have_http_status(200)
    end
  end
end
