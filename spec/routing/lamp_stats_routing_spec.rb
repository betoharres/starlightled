require "rails_helper"

RSpec.describe LampStatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lamp_stats").to route_to("lamp_stats#index")
    end

    it "routes to #new" do
      expect(:get => "/lamp_stats/new").to route_to("lamp_stats#new")
    end

    it "routes to #show" do
      expect(:get => "/lamp_stats/1").to route_to("lamp_stats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lamp_stats/1/edit").to route_to("lamp_stats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lamp_stats").to route_to("lamp_stats#create")
    end

    it "routes to #update" do
      expect(:put => "/lamp_stats/1").to route_to("lamp_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lamp_stats/1").to route_to("lamp_stats#destroy", :id => "1")
    end

  end
end
