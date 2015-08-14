class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :execute_at
      t.integer :code, limit: 2
      t.integer :priority, limit: 2
      t.integer :progress, default: 0, litmit: 2
      t.string :aasm_state
      t.string :description
      t.references :node, index: true, foreign_key: true
      t.references :attachable, polymorphic: true, index: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
