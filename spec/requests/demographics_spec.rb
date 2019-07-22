require 'rails_helper'

RSpec.describe "Demographics", type: :request do
  describe "GET /demographics" do
    it "works! (now write some real specs)" do
      get demographics_path
      expect(response).to have_http_status(200)
    end
  end
end
