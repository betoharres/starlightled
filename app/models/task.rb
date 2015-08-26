class Task < ActiveRecord::Base
  include AASM
  belongs_to :node
  belongs_to :company
  belongs_to :attachable, polymorphic: true

  before_save :execute_at_change

  validates_presence_of :code, :node, :company, :attachable_id, :attachable_type

  audited allow_mass_assignment: true, associated_with: :company, except: :aasm_state

  aasm do
    state :waiting, :initial => true
    state :running
    state :failed
    state :done
  end

  def execute_at_change
    if self.execute_at_changed?
      self.execute_at = execute_at + 3.hours
    end
  end

end
