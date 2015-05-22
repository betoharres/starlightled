json.array!(@lamp_stats) do |lamp_stat|
  json.extract! lamp_stat, :id, :serial_num, :date, :pwr, :current, :volts, :tCom, :tLed1, :tLed2, :sLum, :rssiDev, :lqiDev, :sentPkts, :rcvPkts, :lastReboot, :txPwr, :ctrlRestart, :vFirmware, :vCmd, :cksCfg, :appCksErr, :cmdNotImp, :online, :communicating, :sunrise, :sunset
  json.url lamp_stat_url(lamp_stat, format: :json)
end
