class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.string :name, null: false, unique: true
      t.text :content, null: false
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
