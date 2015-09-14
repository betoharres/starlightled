require 'rails_helper'

RSpec.describe TimeController, type: :controller do

  describe "GET #gmt" do
    it "returns http success" do
      get :gmt
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(DateTime.now.utc.to_s)
    end
  end

  describe "GET #timezone" do
    it "returns http success" do
      get :timezone
      expect(response.body).to eq(DateTime.now.in_time_zone("Brasilia").to_datetime.to_s)
    end
  end

end
