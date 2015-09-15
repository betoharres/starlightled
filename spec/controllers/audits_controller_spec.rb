require 'rails_helper'

RSpec.describe AuditsController, type: :controller do

  before :all do
    @authorized_user = auth_user(ability: :can_all, resource: 'Audit')
    # @unauthorized_user = auth_user(ability: :can_none, resource: 'Audit')
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
