require "rails_helper"

RSpec.describe RejectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rejections").to route_to("rejections#index")
    end

    it "routes to #new" do
      expect(get: "/rejections/new").to route_to("rejections#new")
    end

    it "routes to #show" do
      expect(get: "/rejections/1").to route_to("rejections#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rejections/1/edit").to route_to("rejections#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rejections").to route_to("rejections#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rejections/1").to route_to("rejections#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rejections/1").to route_to("rejections#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rejections/1").to route_to("rejections#destroy", id: "1")
    end
  end
end
