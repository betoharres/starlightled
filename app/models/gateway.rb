class Gateway < ActiveRecord::Base
  has_one :product, as: :productable, dependent: :destroy
  validates_formatting_of :ip, using: :ip_address_v4
end
