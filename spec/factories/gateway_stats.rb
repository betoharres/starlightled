FactoryGirl.define do
  factory :gateway_stat do
    serial_num 123
    date "2015-10-05 15:28:35"
    onlineDev ""
    signal ""
    lqi ""
    rssi ""
    correlation ""
    rcvPkts 1
    sentPkts ""
    lastReboot 1
    temp 1.5
    battery ""
    vKl ""
    vZigbee ""
    errorsCount ""
    alerts ""
    acPwr false
  end

end
