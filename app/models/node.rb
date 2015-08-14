class Node < ActiveRecord::Base
  has_one :product
  has_many :tasks

  belongs_to :network
  belongs_to :company
  validates  :network, presence: true
  # validates :network_belongs_to_company

  audited allow_mass_assignment: true
  acts_as_taggable
end
