class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.bigint :serial_number, null: false
      t.string :mac_address
      t.string :product_code
      t.date :fabrication_date
      t.integer :tension_operation
      t.references :node, index: true
      t.references :productable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_index :products, :serial_number, unique: true
  end
end
