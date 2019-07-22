require 'rails_helper'

RSpec.describe "ApplicantDetails", type: :request do
  describe "GET /applicant_details" do
    it "works! (now write some real specs)" do
      get applicant_details_path
      expect(response).to have_http_status(200)
    end
  end
end
