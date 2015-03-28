json.array!(@specie_profiles) do |specie_profile|
  json.extract! specie_profile, :id, :especiename, :alias, :description, :min_temperature, :max_temperature, :min_surface_temperature, :max_surface_temperature, :min_heart_frequency, :min_relative_humidity, :max_relative_humidity
  json.url specie_profile_url(specie_profile, format: :json)
end
