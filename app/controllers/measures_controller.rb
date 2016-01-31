class MeasuresController < InheritedResources::Base
  skip_before_action :authenticate_user!, only: [:create]
  before_action :set_company, :set_branch, :set_analyte, except: [:create]
  before_action :set_sampling

  before_action :paginate_measures, only: [:index]
  respond_to :html, :xml, :json

  def index
    p = params[:p] if params[:p].to_i >= 0
    l = params[:l] if params[:l].to_i > 0

    @measures = @sampling.measures.by_series p, l, params[:ini_dt], params[:end_dt]
  end

  def create
    @measure = Measure.new(measure_params)
    @measure.serie_label = "{#{@measure.unit} - #{@measure.serie}"
    @measure.sampling = @sampling

    if @measure.save
      render json: @measure, status: :created
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  private
    def measure_params
      params.require(:measure).permit(:value, :unit, :dateandtime, :serie)
    end

    def set_company
      @company = current_user.companies.find(params[:company_id])
      unless @company
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    def set_branch
      @branch = @company.branches.find(params[:branch_id])
      unless @branch
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    def set_analyte
      @analyte = @branch.analytes.find(params[:analyte_id])
      unless @analyte
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    def set_sampling
      @sampling = Sampling.find(params[:sampling_id])
      unless @sampling
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    def paginate_measures
      @measures = Measure.order(:dateandtime).page(params[:page])
    end
end

