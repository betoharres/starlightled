class Network < ActiveRecord::Base
  belongs_to :company
  has_many :networks_nodes
  has_many :nodes, through: :network_nodes
end
