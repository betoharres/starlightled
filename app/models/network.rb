class Network < ActiveRecord::Base
  belongs_to :company
  has_many :nodes

  audited allow_mass_assignment: true, associated_with: :company
end
