class Network < ActiveRecord::Base
  belongs_to :company
  has_many :nodes
end
