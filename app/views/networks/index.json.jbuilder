json.array!(@networks) do |network|
  json.extract! network, :id, :name, :company_id
  json.url network_url(network, format: :json)
end
