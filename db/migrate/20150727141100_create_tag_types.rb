class CreateTagTypes < ActiveRecord::Migration
  def change
    create_table :tag_types do |t|
      t.string :name
      t.string :description
      t.boolean :exclusive
      t.integer :ability
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
