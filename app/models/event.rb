class Event < ActiveRecord::Base
  belongs_to :node
  belongs_to :event_code
  belongs_to :param
  belongs_to :company
end
