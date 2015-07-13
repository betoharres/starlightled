class Role < ActiveRecord::Base
  has_many :users
  belongs_to :company
  has_many :permissions

  audited allow_mass_assignment: true
end
