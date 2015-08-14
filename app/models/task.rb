class Task < ActiveRecord::Base
  include AASM
  belongs_to :node
  belongs_to :company
  belongs_to :attachable, polymorphic: true
  before_save :execute_at_to_utc

  audited allow_mass_assignment: true, associated_with: :company

  aasm do
    state :waiting, :initial => true
    state :running
    state :failed
    state :done
  end

  def execute_at_to_utc
    # TODO: This must be fixed soon, it adds 3.hours because the user is setting
    # a time imaginning the time in Brazil, but the app doesn't check where the device is.
    # The app has to check where the Node is geolocated and get it's timezone and then
    # add or substract the correct timezone
    self.execute_at = (self.execute_at + 3.hours)
  end
end
