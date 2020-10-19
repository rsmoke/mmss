require "rails_helper"

RSpec.describe SessionAssignmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/session_assignments").to route_to("session_assignments#index")
    end

    it "routes to #new" do
      expect(get: "/session_assignments/new").to route_to("session_assignments#new")
    end

    it "routes to #show" do
      expect(get: "/session_assignments/1").to route_to("session_assignments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/session_assignments/1/edit").to route_to("session_assignments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/session_assignments").to route_to("session_assignments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/session_assignments/1").to route_to("session_assignments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/session_assignments/1").to route_to("session_assignments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/session_assignments/1").to route_to("session_assignments#destroy", id: "1")
    end
  end
end
