class MeasuresController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :default_params
  before_action :paginate_measures, only: [:index]
  respond_to :html, :xml, :json

  def index
    @measures = @sampling.measures.by_series params[:l], params[:p], params[:ini_dt], params[:end_dt]
  end

  private
    def measure_params
      params.require(:measure).permit(:analyte_id, :value, :unit, :dateandtime)
    end

    def default_params
      @company = Company.find(params[:company_id])
      @branch = Branch.find(params[:branch_id])
      @analyte = Analyte.find(params[:analyte_id])
      @sampling = Sampling.find(params[:sampling_id])
    end

    def paginate_measures
      @measures = Measure.order(:dateandtime).page(params[:page])
    end
end

