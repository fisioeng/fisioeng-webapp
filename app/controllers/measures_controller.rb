class MeasuresController < InheritedResources::Base
  skip_before_action :authenticate_user!
  before_action :default_params
  before_action :paginate_measures, only: [:index]
  respond_to :html, :xml, :json

  def index
    p = params[:p] if params[:p].to_i >= 0
    l = params[:l] if params[:l].to_i > 0

    @measures = @sampling.measures.by_series p, l, params[:ini_dt], params[:end_dt]
  end

  def create
    @measure = Measure.new(measure_params)

    @measure.sampling = @sampling

    if @measure.save
      render json: @measure, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  private
    def measure_params
      params.require(:measure).permit(:sampling_id, :value, :unit, :dateandtime, :serie)
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

