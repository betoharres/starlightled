class AddIndexWithUniquenesstoSerialNumberInProducts < ActiveRecord::Migration
  def change
    add_index :products, :serial_number, unique: true
  end
end
