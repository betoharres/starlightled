json.array!(@companies) do |company|
  json.extract! company, :id, :user_id, :name, :cnpj, :address, :phone, :email
  json.url company_url(company, format: :json)
end
