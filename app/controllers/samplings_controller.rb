class SamplingsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_company, :set_branch, :set_analyte
  before_action :set_sampling, only: [:show, :edit, :update, :destroy]

  respond_to :html, :xml, :json

  def show
    @measures = @sampling.measures.order(created_at: :desc).page(params[:page])
  end

  def create
    @sampling = Sampling.new(sampling_params)

    @sampling.analyte = @analyte

    respond_to do |format|
      if @sampling.save
        format.html { redirect_to company_branch_analyte_sampling_path(@company, @branch, @analyte, @sampling), notice: 'Sampling was successfully created.' }
        format.json { render :show, status: :created, location: @sampling }
      else
        format.html { render :new }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sampling.update(sampling_params)
        format.html { redirect_to company_branch_analyte_sampling_path(@company, @branch, @analyte, @sampling), notice: 'Sampling was successfully created.' }
        format.json { render :show, status: :created, location: @sampling }
      else
        format.html { render :edit }
        format.json { render json: @sampling.errors, status: :unprocessable_entity }
      end
    end
  end

  private
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

    def sampling_params
      params.require(:sampling).permit(:name)
    end

    def set_sampling
      @sampling = @analyte.samplings.find(params[:id])
    end
end

