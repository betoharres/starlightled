class Task < ActiveRecord::Base
  include AASM
  belongs_to :node
  belongs_to :company
  belongs_to :attachable, polymorphic: true
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
