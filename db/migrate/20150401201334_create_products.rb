class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.string :serial_number
      t.string :mac_address
      t.string :product_code
      t.date :fabrication_date
      t.integer :tension_operation
      t.references :node, index: true
      t.references :productable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
