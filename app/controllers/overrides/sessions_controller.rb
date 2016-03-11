module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    before_action :configure_permitted_parameters

    def create
      gateway = Product.find_by(serial_number: params[:serial_number],
                          company_id: params[:company_key])

      unless gateway && gateway.productable_type == 'Gateway'
        render status: :unauthorized
      end
      super
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) << [:serial_number, :company_key]
    end
  end
end
