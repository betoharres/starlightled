module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:serial_number, :company_key]
    end
  end
end
