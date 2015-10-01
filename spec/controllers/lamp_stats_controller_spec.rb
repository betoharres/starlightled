require 'rails_helper'

RSpec.describe LampStatsController, type: :controller do

  before :all do
    @authorized_user = auth_user(ability: :can_all, resource: 'Lamp')
  end
  before :each do
    sign_in @authorized_user
  end

  let(:valid_attributes) {
    {
     :serial_num=>123,
     :date=>DateTime.now,
     :pwr=>31,
     :current=>0.0,
     :volts=>0.0,
     :tCom=>28.6,
     :tLed1=>26.7,
     :tLed2=>26.9,
     :sLum=>330,
     :rssiDev=>-37,
     :lqiDev=>141,
     :correlationDev=>107,
     :rssi=>-36,
     :lqi=>144,
     :correlation=>108,
     :sentPkts=>819,
     :rcvPkts=>816,
     :lastReboot=>3119,
     :txPwr=>7,
     :ctrlRestart=>32784,
     :vFirmware=>7,
     :vCmd=>7,
     :cksCfg=>2819,
     :appCksErr=>0,
     :cmdNotImp=>0,
     :online=>false,
     :communicating=>true,
     :sunrise=>"7:06",
     :sunset=>"17:43",
     :alerts=>0,
     :errorsDev=>0
    }
  }

  let(:invalid_attributes) {
    {serial_num: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LampStatsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all lamp_stats as @lamp_stats" do
      lamp_stat = LampStat.create! valid_attributes
      lamp = FactoryGirl.create(:lamp)
      get :index, {lamp_id: lamp.id }, valid_session
      expect(assigns(:chart)).to eq([lamp_stat])
    end
  end

  describe "GET #show" do
    it "assigns the requested lamp_stat as @lamp_stat" do
      lamp_stat = LampStat.create! valid_attributes
      get :show, {:id => lamp_stat.to_param}, valid_session
      expect(assigns(:lamp_stat)).to eq(lamp_stat)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new lamp_stat as @lamp_stat" do
  #     get :new, {}, valid_session
  #     expect(assigns(:lamp_stat)).to be_a_new(LampStat)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested lamp_stat as @lamp_stat" do
  #     lamp_stat = LampStat.create! valid_attributes
  #     get :edit, {:id => lamp_stat.to_param}, valid_session
  #     expect(assigns(:lamp_stat)).to eq(lamp_stat)
  #   end
  # end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new LampStat" do
        expect {
          post :create, {:lamp_stat => valid_attributes}, valid_session
        }.to change(LampStat, :count).by(1)
      end

      it "assigns a newly created lamp_stat as @lamp_stat without pending task" do
        post :create, {format: :json, :lamp_stat => valid_attributes}
        expect(assigns(:lamp_stat)).to be_a(LampStat)
        expect(assigns(:lamp_stat)).to be_persisted
        # expect(response.status).to eq(204)
      end

      it "assigns a newly created lamp_stat as @lamp_stat with pending task" do
        product = FactoryGirl.create(:product, serial_number: 123)
        task = FactoryGirl.create(:task, node: product.node, company: product.company)
        post :create, {:lamp_stat => valid_attributes}, valid_session
        expect(assigns(:lamp_stat)).to be_a(LampStat)
        expect(assigns(:lamp_stat)).to be_persisted
        expect(assigns(:tasks)).to be_a(Hash)
        expect(assigns(:tasks)["id"]).to eq(task.id)
      end

      # it "redirects to the created lamp_stat" do
      #   post :create, {:lamp_stat => valid_attributes}, valid_session
      #   expect(response).to redirect_to(LampStat.last)
      # end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved lamp_stat as @lamp_stat" do
        post :create, {:lamp_stat => invalid_attributes}, valid_session
        expect(assigns(:lamp_stat)).to be_a_new(LampStat)
      end

      # it "re-renders the 'new' template" do
      #   post :create, {:lamp_stat => invalid_attributes}, valid_session
      #   expect(response).to render_template("new")
      # end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested lamp_stat" do
  #       lamp_stat = LampStat.create! valid_attributes
  #       put :update, {:id => lamp_stat.to_param, :lamp_stat => new_attributes}, valid_session
  #       lamp_stat.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested lamp_stat as @lamp_stat" do
  #       lamp_stat = LampStat.create! valid_attributes
  #       put :update, {:id => lamp_stat.to_param, :lamp_stat => valid_attributes}, valid_session
  #       expect(assigns(:lamp_stat)).to eq(lamp_stat)
  #     end
  #
  #     it "redirects to the lamp_stat" do
  #       lamp_stat = LampStat.create! valid_attributes
  #       put :update, {:id => lamp_stat.to_param, :lamp_stat => valid_attributes}, valid_session
  #       expect(response).to redirect_to(lamp_stat)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the lamp_stat as @lamp_stat" do
  #       lamp_stat = LampStat.create! valid_attributes
  #       put :update, {:id => lamp_stat.to_param, :lamp_stat => invalid_attributes}, valid_session
  #       expect(assigns(:lamp_stat)).to eq(lamp_stat)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       lamp_stat = LampStat.create! valid_attributes
  #       put :update, {:id => lamp_stat.to_param, :lamp_stat => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested lamp_stat" do
  #     lamp_stat = LampStat.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => lamp_stat.to_param}, valid_session
  #     }.to change(LampStat, :count).by(-1)
  #   end
  #
  #   it "redirects to the lamp_stats list" do
  #     lamp_stat = LampStat.create! valid_attributes
  #     delete :destroy, {:id => lamp_stat.to_param}, valid_session
  #     expect(response).to redirect_to(lamp_stats_url)
  #   end
  # end

end
