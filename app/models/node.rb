class Node < ActiveRecord::Base
  has_one :products

  belongs_to :network
  validates  :network, presence: true
  # validates :network_belongs_to_company

  audited allow_mass_assignment: true
  acts_as_taggable
end
