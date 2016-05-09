class CreateParams < ActiveRecord::Migration
  def change
    create_table :params do |t|
      t.string :name, unique: true, null: false
      t.integer :code, unique, true, null: false, limit: 2
      t.text :description

      t.timestamps null: false
    end
  end
end
