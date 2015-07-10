class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.bigint :serial_number, index: true, null: false
      t.string :mac_address
      t.integer :product_code
      t.integer :product_revision
      t.date :fabrication_date
      t.integer :tension_operation
      t.references :node, index: true
      t.references :company, index: true, null: false
      t.references :productable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
