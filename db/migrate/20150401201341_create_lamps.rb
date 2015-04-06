class CreateLamps < ActiveRecord::Migration
  def change
    create_table :lamps do |t|
      t.string :font_type
      t.string :font_subtype

      t.timestamps
    end
  end
end
