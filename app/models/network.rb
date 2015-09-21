class Network < ActiveRecord::Base
  belongs_to :company
  has_many :nodes

  validates :name, presence: true

  audited allow_mass_assignment: true, associated_with: :company
  acts_as_taggable
end
