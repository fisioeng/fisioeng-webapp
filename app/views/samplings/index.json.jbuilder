json.array!(@samplings) do |sampling|
  json.extract! sampling, :id, :analyte_id, :name
  json.url sampling_url(sampling, format: :json)
end
