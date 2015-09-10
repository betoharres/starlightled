# stub sign_in method https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
module ControllerHelpers

  def auth_user(options = {})
    permission = FactoryGirl.create(:permission, ability: options[:ability], resource: options[:resource])
    authorized_user = FactoryGirl.create(:user, role: permission.role)
    authorized_user.company = FactoryGirl.create(:company, user: authorized_user)
    authorized_user
  end

  def sign_in(user = double('user'))
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerHelpers, :type => :controller
end
