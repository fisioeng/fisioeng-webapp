class CompaniesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = current_user.companies.all
  end

  def show
    @branches = @company.branches
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user = current_user

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_company
      @company = current_user.companies.find(params[:id])

      unless @company
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    def company_params
      params.require(:company).permit(:cnpj, :alias, :name, :logo, :description)
    end
end
