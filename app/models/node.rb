class Node < ActiveRecord::Base
  has_many :products
  belongs_to :network

  audited allow_mass_assignment: true
end
