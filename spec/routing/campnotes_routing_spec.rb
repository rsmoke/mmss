require "rails_helper"

RSpec.describe CampnotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/campnotes").to route_to("campnotes#index")
    end

    it "routes to #new" do
      expect(get: "/campnotes/new").to route_to("campnotes#new")
    end

    it "routes to #show" do
      expect(get: "/campnotes/1").to route_to("campnotes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/campnotes/1/edit").to route_to("campnotes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/campnotes").to route_to("campnotes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/campnotes/1").to route_to("campnotes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/campnotes/1").to route_to("campnotes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/campnotes/1").to route_to("campnotes#destroy", id: "1")
    end
  end
end
