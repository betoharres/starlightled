class Gateway < ActiveRecord::Base
  validates_formatting_of :ip, using: :ip_address_v4
end
