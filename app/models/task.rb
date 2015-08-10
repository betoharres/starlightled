class Task < ActiveRecord::Base
  include AASM

  belongs_to :node
end
