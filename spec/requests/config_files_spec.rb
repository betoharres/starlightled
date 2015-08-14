require 'rails_helper'

RSpec.describe "ConfigFiles", type: :request do
  describe "GET /config_files" do
    it "works! (now write some real specs)" do
      get config_files_path
      expect(response).to have_http_status(200)
    end
  end
end
