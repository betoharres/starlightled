json.array!(@permissions) do |permission|
  json.extract! permission, :id, :resource, :ability, :role_id
  json.url permission_url(permission, format: :json)
end
