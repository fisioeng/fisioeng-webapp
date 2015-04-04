def extract json, measure
  json.extract! measure, :id, :value, :unit, :dateandtime, :serie, :serie_label
  json.url company_branch_analyte_measure_url(@company, @branch, @analyte, measure, format: :json)
end

json.array!(@measures) do |data|
  if data.instance_of?(Measure)
    extract json, data
  else
    json.array!(data) do |measure|
      extract json, measure
    end
  end
end

