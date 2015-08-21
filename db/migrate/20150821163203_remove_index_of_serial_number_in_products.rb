class RemoveIndexOfSerialNumberInProducts < ActiveRecord::Migration
  def change
    remove_index :products, :serial_number
  end
end
