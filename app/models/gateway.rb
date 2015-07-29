class Gateway < ActiveRecord::Base
  has_one :product, as: :productable, dependent: :destroy

  validates_presence_of :ip, :url_connection
  validates_formatting_of :ip, using: :ip_address_v4

  accepts_nested_attributes_for :product
  audited allow_mass_assignment: true
  acts_as_taggable
end
