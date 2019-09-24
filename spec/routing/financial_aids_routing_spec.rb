require "rails_helper"

RSpec.describe FinancialAidsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/financial_aids").to route_to("financial_aids#index")
    end

    it "routes to #new" do
      expect(:get => "/financial_aids/new").to route_to("financial_aids#new")
    end

    it "routes to #show" do
      expect(:get => "/financial_aids/1").to route_to("financial_aids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/financial_aids/1/edit").to route_to("financial_aids#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/financial_aids").to route_to("financial_aids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/financial_aids/1").to route_to("financial_aids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/financial_aids/1").to route_to("financial_aids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/financial_aids/1").to route_to("financial_aids#destroy", :id => "1")
    end
  end
end
