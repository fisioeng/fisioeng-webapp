json.array!(@branches) do |branch|
  json.extract! branch, :id, :company_id, :alias, :cep, :number, :street_address, :neighborhood, :city, :uf, :country, :complement
  json.url branch_url(branch, format: :json)
end
