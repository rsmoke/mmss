require "rails_helper"

RSpec.describe DemographicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/demographics").to route_to("demographics#index")
    end

    it "routes to #new" do
      expect(:get => "/demographics/new").to route_to("demographics#new")
    end

    it "routes to #show" do
      expect(:get => "/demographics/1").to route_to("demographics#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/demographics/1/edit").to route_to("demographics#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/demographics").to route_to("demographics#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/demographics/1").to route_to("demographics#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/demographics/1").to route_to("demographics#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/demographics/1").to route_to("demographics#destroy", :id => "1")
    end
  end
end
