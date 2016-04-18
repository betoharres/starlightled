class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.integer :code, limit: 2
      t.string :title
      t.string :description
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
