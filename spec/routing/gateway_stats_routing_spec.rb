require "rails_helper"

RSpec.describe GatewayStatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/gateway_stats").to route_to("gateway_stats#index")
    end

    it "routes to #new" do
      expect(:get => "/gateway_stats/new").to route_to("gateway_stats#new")
    end

    it "routes to #show" do
      expect(:get => "/gateway_stats/1").to route_to("gateway_stats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/gateway_stats/1/edit").to route_to("gateway_stats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/gateway_stats").to route_to("gateway_stats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gateway_stats/1").to route_to("gateway_stats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gateway_stats/1").to route_to("gateway_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gateway_stats/1").to route_to("gateway_stats#destroy", :id => "1")
    end

  end
end
