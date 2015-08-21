require 'rails_helper'

RSpec.describe TimeController, type: :controller do

  describe "GET #gmt" do
    it "returns http success" do
      get :gmt
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #timezone" do
    it "returns http success" do
      get :timezone
      expect(response).to have_http_status(:success)
    end
  end

end
