class CompaniesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
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

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = current_user.companies.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:cnpj, :alias, :name, :logo, :description)
    end
end
