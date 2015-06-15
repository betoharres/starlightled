class Node < ActiveRecord::Base
  has_many :products
  belongs_to :network
end
