json.array!(@events) do |event|
  json.extract! event, :id, :active, :node_id, :event_code_id, :param_id, :serial_number
  json.url event_url(event, format: :json)
end
