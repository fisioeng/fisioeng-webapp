class MeasuresController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :paginate_measures, only: [:index]
  respond_to :html, :xml, :json

  private

    def measure_params
      params.require(:measure).permit(:analyte_id, :value, :unit, :dateandtime)
    end

    def paginate_measures
      @measures = Measure.order(:dateandtime).page(params[:page])
    end
end

