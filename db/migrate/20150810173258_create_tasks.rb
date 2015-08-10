class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :execute_at
      t.integer :code
      t.integer :status
      t.string :aasm_state
      t.references :node, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
