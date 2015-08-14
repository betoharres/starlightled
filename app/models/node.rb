class Node < ActiveRecord::Base
  has_one :product
  has_many :tasks

  belongs_to :network
  belongs_to :company
  validates  :network, presence: true

  acts_as_taggable
  audited allow_mass_assignment: true, associated_with: :company
end
