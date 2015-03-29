class SpecieProfilesController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def specie_profile_params
      params.require(:specie_profile).permit(:especiename, :alias, :description, :min_temperature, :max_temperature, :min_surface_temperature, :max_surface_temperature, :min_heart_frequency, :min_relative_humidity, :max_relative_humidity)
    end
end

