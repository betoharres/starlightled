json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :code, :title, :description
  json.url alarm_url(alarm, format: :json)
end
