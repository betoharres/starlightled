json.array!(@networks) do |network|
  json.extract! network, :id, :name, :nodes
  json.url network_url(network, format: :json)
end
