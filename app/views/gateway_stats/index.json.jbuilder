json.array!(@gateway_stats) do |gateway_stat|
  json.extract! gateway_stat, :id, :serial_num, :date, :onlineDev, :signal, :lqi, :rssi, :correlation, :rcvPkts, :sentPkts, :lastReboot, :temp, :battery, :vKl, :vZigbee, :errorsCount, :alerts, :acPwr
  json.url gateway_stat_url(gateway_stat, format: :json)
end
