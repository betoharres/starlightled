json.array!(@gateways) do |gateway|
  json.extract! gateway, :id, :ip, :url_connection
  json.url gateway_url(gateway, format: :json)
end
