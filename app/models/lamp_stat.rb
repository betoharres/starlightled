class LampStat < ActiveRecord::Base
  validates :serial_num, presence: true
end
