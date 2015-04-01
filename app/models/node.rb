class Node < ActiveRecord::Base
  has_many :products
  has_many :networks_nodes
  has_many :networks, throuh: :network_nodes
end
