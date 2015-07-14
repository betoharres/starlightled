class Node < ActiveRecord::Base
  has_many :products

  belongs_to :network
  validates  :network, presence: true

  audited allow_mass_assignment: true
end
