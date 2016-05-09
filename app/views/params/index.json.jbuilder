json.array!(@params) do |param|
  json.extract! param, :id, :name, :code, :description
  json.url param_url(param, format: :json)
end
