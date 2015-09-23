FactoryGirl.define do
  factory :lamp_stat do
    serial_num 123
    date DateTime.now
    pwr 1
    current 1.5
    volts 1.5
    tCom 1.5
    tLed1 1.5
    tLed2 1.5
    sLum 1
    rssiDev 1
    lqiDev 1
    sentPkts 1
    rcvPkts 1
    lastReboot 1
    txPwr 1
    ctrlRestart 1
    vFirmware 1
    vCmd 1
    cksCfg 1
    appCksErr 1
    cmdNotImp 1
    online false
    communicating false
    sunrise "MyString"
    sunset "MyString"
  end

end
