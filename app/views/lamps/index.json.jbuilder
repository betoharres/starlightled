json.array!(@lamps) do |lamp|
  json.extract! lamp, :id, :font_type, :font_subtype, :product_id
  json.url lamp_url(lamp, format: :json)
end
