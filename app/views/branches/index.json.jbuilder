json.array!(@branches) do |branch|
  json.extract! branch, :id, :company_id, :alias, :cep, :number, :street_address, :neighborhood, :city, :uf, :country, :complement
  json.url company_branches_url(@company, branch, format: :json)
end
