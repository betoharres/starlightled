class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.references :company, index: true

      t.timestamps null: false
    end
  end
end
