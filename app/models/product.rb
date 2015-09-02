class Product < ActiveRecord::Base
  belongs_to :productable, polymorphic: true
  belongs_to :node
  belongs_to :company
  validates :tension_operation, numericality: { :greater_than_or_equal_to => 0, message: I18n.t(:not_a_number) }
  validates_presence_of :tension_operation, :name, :model, :serial_number, :mac_address, :product_code, :fabrication_date, message: I18n.t(:cant_be_blank)
  validates_uniqueness_of :node_id, message: I18n.t(:node_duplicated)
  validates_uniqueness_of :serial_number, message: I18n.t(:serial_duplicated)

  def final_product
    productable_type.constantize.find(productable_id)
  end
  # https://github.com/collectiveidea/audited
  audited allow_mass_assignment: true, associated_with: :company
end
