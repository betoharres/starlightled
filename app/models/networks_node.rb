class NetworksNode < ActiveRecord::Base
  belongs_to :network
  belongs_to :node
end
