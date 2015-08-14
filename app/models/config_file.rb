class ConfigFile < ActiveRecord::Base
  belongs_to :company
  has_many :tasks
  validates :name, presence: true

  audited allow_mass_assignment: true, associated_with: :company
end
