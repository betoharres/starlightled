class Lamp < ActiveRecord::Base
  has_one :products, as: :productable, dependent: :destroy
  belongs_to :product
end
