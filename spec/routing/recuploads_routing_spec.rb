require "rails_helper"

RSpec.describe RecuploadsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/recuploads").to route_to("recuploads#index")
    end

    it "routes to #new" do
      expect(:get => "/recuploads/new").to route_to("recuploads#new")
    end

    it "routes to #show" do
      expect(:get => "/recuploads/1").to route_to("recuploads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recuploads/1/edit").to route_to("recuploads#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/recuploads").to route_to("recuploads#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/recuploads/1").to route_to("recuploads#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/recuploads/1").to route_to("recuploads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recuploads/1").to route_to("recuploads#destroy", :id => "1")
    end
  end
end
