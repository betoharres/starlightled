class CreateGatewayStats < ActiveRecord::Migration
  def change
    create_table :gateway_stats do |t|
      t.bigint :serial_num
      t.datetime :date
      t.integer :onlineDev, limit: 2
      t.integer :signal, limit: 2
      t.integer :lqi, limit: 2
      t.integer :rssi, limit: 2
      t.integer :correlation, limit: 2
      t.integer :rcvPkts
      t.integer :sentPkts, limit: 2
      t.integer :lastReboot
      t.float :temp
      t.integer :battery, limit: 2
      t.integer :vKl, limit: 2
      t.integer :vZigbee, limit: 2
      t.integer :errorsCount, limit: 2
      t.integer :alerts, limit: 2
      t.boolean :acPwr

      t.timestamps null: false
    end
  end
end
