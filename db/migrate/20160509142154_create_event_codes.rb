class CreateEventCodes < ActiveRecord::Migration
  def change
    create_table :event_codes do |t|
      t.integer :code       , null: false  , unique: true      , limit: 2
      t.string :name        , unique: true , null: false
      t.references :company , index: true  , foreign_key: true , null: false

      t.timestamps null: false
    end
  end
end
