require "rails_helper"

RSpec.describe ConfigFilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/config_files").to route_to("config_files#index")
    end

    it "routes to #new" do
      expect(:get => "/config_files/new").to route_to("config_files#new")
    end

    it "routes to #show" do
      expect(:get => "/config_files/1").to route_to("config_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/config_files/1/edit").to route_to("config_files#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/config_files").to route_to("config_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/config_files/1").to route_to("config_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/config_files/1").to route_to("config_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/config_files/1").to route_to("config_files#destroy", :id => "1")
    end

  end
end
