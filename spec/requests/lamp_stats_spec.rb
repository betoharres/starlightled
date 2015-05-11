require 'rails_helper'

RSpec.describe "LampStats", type: :request do
  describe "GET /lamp_stats" do
    it "works! (now write some real specs)" do
      get lamp_stats_path
      expect(response).to have_http_status(200)
    end
  end
end
