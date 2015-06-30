class CreateFirmwares < ActiveRecord::Migration
  def change
    create_table :firmwares do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_content
      t.string :checksum
      t.float :version

      t.timestamps null: false
    end
  end
end
