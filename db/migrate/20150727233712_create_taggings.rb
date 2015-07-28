class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :taggable, polymorphic: true, index: true
      t.integer :tagger_id
      t.string :tagger_type
      t.string :context

      t.timestamps null: false
    end
  end
end
