class Gateway < ActiveRecord::Base
  has_one :product, as: :productable, dependent: :destroy

  validates_presence_of :ip, :url_connection
  validates_formatting_of :ip, using: :ip_address_v4

  accepts_nested_attributes_for :product

  # https://github.com/collectiveidea/audited
  audited allow_mass_assignment: true, associated_with: :company

end
