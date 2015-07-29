class Lamp < ActiveRecord::Base
  has_one :product, as: :productable, dependent: :destroy

  validates_presence_of :font_type, :font_subtype
  accepts_nested_attributes_for :product

  audited allow_mass_assignment: true
  acts_as_taggable
end
