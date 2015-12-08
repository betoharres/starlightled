class GatewayAuth < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  attr_accessor :company_key

  before_create :validate_company_key

  def validate_company_key
    raise 'Invalid company key' unless Company.find_by(company_key: company_key)
  end
end
