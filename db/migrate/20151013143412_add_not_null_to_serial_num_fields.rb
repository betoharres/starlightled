class AddNotNullToSerialNumFields < ActiveRecord::Migration
  def change
    change_column :lamp_stats, :serial_num, :bigint, null: false
    change_column :gateway_stats, :serial_num, :bigint, null: false
  end
end
