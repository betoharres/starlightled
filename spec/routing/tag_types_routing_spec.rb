require "rails_helper"

RSpec.describe TagTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag_types").to route_to("tag_types#index")
    end

    it "routes to #new" do
      expect(:get => "/tag_types/new").to route_to("tag_types#new")
    end

    it "routes to #show" do
      expect(:get => "/tag_types/1").to route_to("tag_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tag_types/1/edit").to route_to("tag_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tag_types").to route_to("tag_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag_types/1").to route_to("tag_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag_types/1").to route_to("tag_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag_types/1").to route_to("tag_types#destroy", :id => "1")
    end

  end
end
