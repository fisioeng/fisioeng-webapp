json.array!(@analytes) do |analyte|
  json.extract! analyte, :id, :branch_id, :specie_profile_id, :code, :name, :birthdate, :weight, :lanado, :color
  json.url company_branch_analytes_url(@company, @branch, analyte, format: :json)
end
