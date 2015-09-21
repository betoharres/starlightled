require 'rails_helper'

RSpec.describe LandingsController, type: :controller do

  before :all do
    @authorized_user = auth_user(ability: :can_all, resource: 'Landing')
  end
  before :each do
    sign_in @authorized_user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
