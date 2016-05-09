require 'rails_helper'

RSpec.describe "Params", type: :request do
  describe "GET /params" do
    it "works! (now write some real specs)" do
      get params_path
      expect(response).to have_http_status(200)
    end
  end
end
