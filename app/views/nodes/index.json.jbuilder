json.array!(@nodes) do |node|
  json.extract! node, :id, :identifier, :latitude, :longitude
  json.url node_url(node, format: :json)
end
