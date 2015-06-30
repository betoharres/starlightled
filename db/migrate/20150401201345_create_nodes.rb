class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :identifier
      t.references :network, index: true
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6


      t.timestamps null: false
    end
  end
end
