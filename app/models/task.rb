class Task < ActiveRecord::Base
  include AASM
  belongs_to :node
  before_save :execute_at_to_utc

  aasm do
    state :waiting, :initial => true
    state :running
    state :failed
    state :done
  end

  def execute_at_to_utc
    execute_at = execute_at.utc
  end
end
