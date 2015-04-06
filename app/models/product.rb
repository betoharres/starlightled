class Product < ActiveRecord::Base
  belongs_to :productable, polymorphic: true
  belongs_to :node
end
