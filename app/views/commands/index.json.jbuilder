json.array!(@commands) do |command|
  json.extract! command, :id, :content, :company_id
  json.url command_url(command, format: :json)
end
