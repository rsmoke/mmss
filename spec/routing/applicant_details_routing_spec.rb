require "rails_helper"

RSpec.describe ApplicantDetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/applicant_details").to route_to("applicant_details#index")
    end

    it "routes to #new" do
      expect(:get => "/applicant_details/new").to route_to("applicant_details#new")
    end

    it "routes to #show" do
      expect(:get => "/applicant_details/1").to route_to("applicant_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/applicant_details/1/edit").to route_to("applicant_details#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/applicant_details").to route_to("applicant_details#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/applicant_details/1").to route_to("applicant_details#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/applicant_details/1").to route_to("applicant_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/applicant_details/1").to route_to("applicant_details#destroy", :id => "1")
    end
  end
end
