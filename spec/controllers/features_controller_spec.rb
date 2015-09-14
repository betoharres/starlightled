require 'rails_helper'

RSpec.describe FeaturesController, type: :controller do

  describe "GET #time" do
    it "returns http success" do
      get :time
      expect(response.body).to eq(DateTime.now.in_time_zone("Brasilia").to_datetime.to_s)
    end
  end

end
