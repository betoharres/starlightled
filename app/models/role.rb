class Role < ActiveRecord::Base
  has_many :users
  belongs_to :company
  has_many :permissions

  validates :name, presence: true

  audited allow_mass_assignment: true, associated_with: :company
end
