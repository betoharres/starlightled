require 'rails_helper'

RSpec.describe FirmwaresController, type: :controller do

  let(:valid_attributes) {
    {
      file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/tmp/test/test')))
    }
  }

  let(:invalid_attributes) {
    {file: nil, filename: nil, content_type: nil, file_content: nil}
  }

 let(:valid_session) { {} }

  before :all do
    Firmware.destroy_all
    @authorized_user = auth_user(ability: :can_all, resource: 'Firmware')
  end
  before :each do
    sign_in @authorized_user
  end

  describe "GET #index" do
    it "assigns all firmwares as @firmwares" do
      firmware = Firmware.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:firmwares)).to eq([firmware])
    end
  end

  describe "GET #show" do
    it "assigns the requested firmware as @firmware" do
      firmware = Firmware.create! valid_attributes
      get :show, {:id => firmware.to_param}, valid_session
      expect(assigns(:firmware)).to eq(firmware)
    end
  end

  describe "GET #new" do
    it "assigns a new firmware as @firmware" do
      get :new, {}, valid_session
      expect(assigns(:firmware)).to be_a_new(Firmware)
    end
  end

  describe "GET #edit" do
    it "assigns the requested firmware as @firmware" do
      firmware = Firmware.create! valid_attributes
      get :edit, {:id => firmware.to_param}, valid_session
      expect(assigns(:firmware)).to eq(firmware)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Firmware" do
        expect {
          post :create, {:firmware => valid_attributes}, valid_session
        }.to change(Firmware, :count).by(1)
      end

      it "assigns a newly created firmware as @firmware" do
        post :create, {:firmware => valid_attributes}, valid_session
        expect(assigns(:firmware)).to be_a(Firmware)
        expect(assigns(:firmware)).to be_persisted
      end

      it "redirects to the created firmware" do
        post :create, {:firmware => valid_attributes}, valid_session
        expect(response).to redirect_to(firmwares_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved firmware as @firmware" do
        post :create, {:firmware => invalid_attributes}, valid_session
        expect(assigns(:firmware)).to be_a_new(Firmware)
      end

      it "re-renders the 'new' template" do
        post :create, {:firmware => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/tmp/test/example2.bin'))),
          filename: 'example2.bin',
          checksum: Digest::SHA1.hexdigest(Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/tmp/test/example2.bin'))).read)
        }
      }

      it "updates the requested firmware" do
        firmware = Firmware.create! valid_attributes
        put :update, {:id => firmware.to_param, :firmware => new_attributes }, valid_session
        firmware.reload
        expect(firmware.filename).to eql new_attributes[:filename]
        expect(firmware.checksum).to eql new_attributes[:checksum]
      end

      it "assigns the requested firmware as @firmware" do
        firmware = Firmware.create! valid_attributes
        put :update, {:id => firmware.to_param, :firmware => new_attributes}, valid_session
        expect(assigns(:firmware)).to eq(firmware)
      end

      it "redirects to the firmware" do
        firmware = Firmware.create! valid_attributes
        put :update, {:id => firmware.to_param, :firmware => new_attributes}, valid_session
        expect(response).to redirect_to(firmwares_path)
      end
    end

    context "with invalid params" do
      it "assigns the firmware as @firmware" do
        firmware = Firmware.create! valid_attributes
        put :update, {:id => firmware.to_param, :firmware => invalid_attributes}, valid_session
        expect(assigns(:firmware)).to eq(firmware)
      end

      it "re-renders the 'edit' template" do
        firmware = Firmware.create! valid_attributes
        put :update, {:id => firmware.to_param, :firmware => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested firmware" do
      firmware = Firmware.create! valid_attributes
      expect {
        delete :destroy, {:id => firmware.to_param}, valid_session
      }.to change(Firmware, :count).by(-1)
    end

    it "redirects to the firmwares list" do
      firmware = Firmware.create! valid_attributes
      delete :destroy, {:id => firmware.to_param}, valid_session
      expect(response).to redirect_to(firmwares_url)
    end
  end

end
