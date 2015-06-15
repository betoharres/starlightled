class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :identifier
      t.references :network, index: true

      t.timestamps null: false
    end
  end
end
