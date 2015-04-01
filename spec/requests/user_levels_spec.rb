require 'rails_helper'

RSpec.describe "UserLevels", type: :request do
  describe "GET /user_levels" do
    it "works! (now write some real specs)" do
      get user_levels_path
      expect(response).to have_http_status(200)
    end
  end
end
