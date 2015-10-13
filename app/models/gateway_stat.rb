class GatewayStat < ActiveRecord::Base
  validates :serial_num, presence: true
end
