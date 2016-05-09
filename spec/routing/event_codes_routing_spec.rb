require "rails_helper"

RSpec.describe EventCodesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/event_codes").to route_to("event_codes#index")
    end

    it "routes to #new" do
      expect(:get => "/event_codes/new").to route_to("event_codes#new")
    end

    it "routes to #show" do
      expect(:get => "/event_codes/1").to route_to("event_codes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/event_codes/1/edit").to route_to("event_codes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/event_codes").to route_to("event_codes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/event_codes/1").to route_to("event_codes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/event_codes/1").to route_to("event_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/event_codes/1").to route_to("event_codes#destroy", :id => "1")
    end

  end
end
