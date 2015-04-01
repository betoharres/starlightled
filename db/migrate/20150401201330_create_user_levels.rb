class CreateUserLevels < ActiveRecord::Migration
  def change
    create_table :user_levels do |t|
      t.integer :level
      t.references :user, index: true

      t.timestamps
    end
  end
end
