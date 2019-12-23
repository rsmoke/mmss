require 'rails_helper'

RSpec.describe "Recuploads", type: :request do
  describe "GET /recuploads" do
    it "works! (now write some real specs)" do
      get recuploads_path
      expect(response).to have_http_status(200)
    end
  end
end
