require 'rails_helper'

RSpec.describe "EventCodes", type: :request do
  describe "GET /event_codes" do
    it "works! (now write some real specs)" do
      get event_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
