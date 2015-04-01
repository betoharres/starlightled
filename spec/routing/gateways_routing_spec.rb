require "rails_helper"

RSpec.describe GatewaysController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gateways").to route_to("gateways#index")
    end

    it "routes to #new" do
      expect(:get => "/gateways/new").to route_to("gateways#new")
    end

    it "routes to #show" do
      expect(:get => "/gateways/1").to route_to("gateways#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gateways/1/edit").to route_to("gateways#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gateways").to route_to("gateways#create")
    end

    it "routes to #update" do
      expect(:put => "/gateways/1").to route_to("gateways#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gateways/1").to route_to("gateways#destroy", :id => "1")
    end

  end
end
