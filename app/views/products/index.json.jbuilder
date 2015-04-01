json.array!(@products) do |product|
  json.extract! product, :id, :name, :model, :serial_number, :mac_address, :product_code, :fabrication_date, :tension_operation, :node_id
  json.url product_url(product, format: :json)
end
