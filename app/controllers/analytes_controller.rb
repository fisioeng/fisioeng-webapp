class AnalytesController < InheritedResources::Base
  respond_to :html, :xml, :json

  belongs_to :company do
    belongs_to :branch
  end

  private
    def analyte_params
      params.require(:analyte).permit(:branch_id, :specie_profile_id, :code, :name, :birthdate, :weight, :lanado, :color)
    end
end

