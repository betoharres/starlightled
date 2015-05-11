class CreateLampStats < ActiveRecord::Migration
  def change
    create_table :lamp_stats do |t|
      t.integer :serialNum
      t.datetime :date
      t.integer :pwr
      t.float :current
      t.float :volts
      t.float :tCom
      t.float :tLed1
      t.float :tLed2
      t.integer :sLum
      t.integer :rssiDev
      t.integer :lqiDev
      t.integer :sentPkts
      t.integer :rcvPkts
      t.integer :lastReboot
      t.integer :txPwr
      t.integer :ctrlRestart
      t.integer :vFirmware
      t.integer :vCmd
      t.integer :cksCfg
      t.integer :appCksErr
      t.integer :cmdNotImp
      t.boolean :online
      t.boolean :communicating
      t.string :sunrise
      t.string :sunset

      t.timestamps null: false
    end
  end
end
