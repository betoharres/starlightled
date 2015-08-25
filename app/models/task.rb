class Task < ActiveRecord::Base
  include AASM
  belongs_to :node
  belongs_to :company
  belongs_to :attachable, polymorphic: true

  validates_presence_of :code, :node, :company, :attachable_id, :attachable_type

  audited allow_mass_assignment: true, associated_with: :company

  aasm do
    state :waiting, :initial => true
    state :running
    state :failed
    state :done
  end

end
