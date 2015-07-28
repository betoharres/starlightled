class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :description
      t.integer :taggings_count
      t.references :company, index: true, foreign_key: true
      t.references :tag_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
