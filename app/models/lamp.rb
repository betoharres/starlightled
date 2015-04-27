class Lamp < ActiveRecord::Base
  has_one :product, as: :productable, dependent: :destroy

  validates_presence_of :font_type, :font_subtype
  accepts_nested_attributes_for :product

  # https://github.com/collectiveidea/audited
  audited

end
