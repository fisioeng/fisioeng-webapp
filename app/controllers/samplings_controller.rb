class SamplingsController < InheritedResources::Base

  private

    def sampling_params
      params.require(:sampling).permit(:analyte_id, :name)
    end
end

