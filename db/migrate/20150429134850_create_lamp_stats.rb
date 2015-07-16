class CreateLampStats < ActiveRecord::Migration
  def change
    create_table :lamp_stats do |t|
      # bigint was needed because the lamps are going to use serial number from 0
     # to 4 billion; Also, we didn't use serial because it's autoincrementing
     # TODO change serial_num to serial_number
      t.bigint :serial_num      , index: true
      t.datetime :date
      t.integer :pwr            , limit: 2 # limit: 2 for 2 bytes
      t.float :current
      t.float :volts
      t.float :tCom
      t.float :tLed1
      t.float :tLed2
      t.integer :sLum
      t.integer :rssiDev        , limit: 2
      t.integer :lqiDev         , limit: 2
      t.integer :correlationDev , limit: 2
      t.integer :rssi           , limit: 2
      t.integer :lqi            , limit: 2
      t.integer :correlation    , limit: 2
      t.bigint :sentPkts
      t.bigint :rcvPkts
      t.bigint :lastReboot
      t.integer :txPwr          , limit: 2
      t.bigint :ctrlRestart
      t.integer :vFirmware      , limit: 2
      t.integer :vCmd
      t.integer :cksCfg
      t.integer :appCksErr
      t.integer :cmdNotImp
      t.boolean :online
      t.boolean :communicating
      t.string :sunrise         , limit: 40
      t.string :sunset          , limit: 40

      t.timestamps null: false
    end
  end
end
