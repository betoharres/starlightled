require "rails_helper"

RSpec.describe UserLevelsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_levels").to route_to("user_levels#index")
    end

    it "routes to #new" do
      expect(:get => "/user_levels/new").to route_to("user_levels#new")
    end

    it "routes to #show" do
      expect(:get => "/user_levels/1").to route_to("user_levels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_levels/1/edit").to route_to("user_levels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_levels").to route_to("user_levels#create")
    end

    it "routes to #update" do
      expect(:put => "/user_levels/1").to route_to("user_levels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_levels/1").to route_to("user_levels#destroy", :id => "1")
    end

  end
end
