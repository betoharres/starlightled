class Role < ActiveRecord::Base
  has_one :user
  belongs_to :company
  has_many :permissions
end
