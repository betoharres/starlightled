class Product < ActiveRecord::Base
  belongs_to :productable, polymorphic: true
  belongs_to :node
  belongs_to :company
  validates :tension_operation, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :tension_operation, :name, :model, :serial_number, :mac_address, :product_code, :fabrication_date, :tension_operation

  def final_product
    productable_type.constantize.find(productable_id)
  end
  # https://github.com/collectiveidea/audited
  audited allow_mass_assignment: true, associated_with: :company
end
