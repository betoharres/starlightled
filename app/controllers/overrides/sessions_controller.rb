module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    before_action :configure_permitted_parameters

    def create
      unless Company.find_by(company_key: params[:company_key].to_s) &&
              Product.find_by(serial_number: params[:serial_number])
        raise 'Invalid company_key or serial_number'
      end
      super
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) << [:serial_number, :company_key]
    end
  end
end
