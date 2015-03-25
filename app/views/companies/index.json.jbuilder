json.array!(@companies) do |company|
  json.extract! company, :id, :cnpj, :alias, :name, :logo, :description
  json.url company_url(company, format: :json)
end
