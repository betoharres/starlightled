class Product < ActiveRecord::Base
  belongs_to :productable, polymorphic: true
  belongs_to :node
  validates :tension_operation, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :tension_operation, :name, :model, :serial_number, :mac_address, :product_code, :fabrication_date, :tension_operation

end
