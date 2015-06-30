class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :model
      t.bigint :serial_number, null: false # unico por codigo de produto, indice de tabela
      t.string :mac_address
      t.integer :product_code, index: true, unique: true # unico para cada familia de produtos, ex: 8000022, indice de tabela
      t.integer :product_revision # revisao do codigo de produto
      t.date :fabrication_date
      t.integer :tension_operation
      t.references :node, index: true
      t.references :company, index: true, null: false
      t.references :productable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_index :products, :serial_number, unique: true
  end
end
