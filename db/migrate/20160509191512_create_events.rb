class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.boolean :active, default: true
      t.references :node, index: true, foreign_key: true, null: false
      t.references :event_code, index: true, foreign_key: true, null: false
      t.references :param, index: true, foreign_key: true, null: false
      t.integer :serial_number, limit: 8, unique: true, index: true, null: false

      t.timestamps null: false
    end
  end
end
