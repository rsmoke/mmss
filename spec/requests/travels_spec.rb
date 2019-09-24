require 'rails_helper'

RSpec.describe "Travels", type: :request do
  describe "GET /travels" do
    it "works! (now write some real specs)" do
      get travels_path
      expect(response).to have_http_status(200)
    end
  end
end
