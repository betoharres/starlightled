require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do

  describe "GET #time" do
    it "returns http success" do
      get :time
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #last_record" do
    it "returns http success" do
      get :last_record
      expect(response).to have_http_status(:success)
    end
  end

end
