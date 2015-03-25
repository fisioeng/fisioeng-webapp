class BranchesController < InheritedResources::Base

  def new
  	@company = Company.find(params[:company_id])
  	@branch = @company.branches.new

  end

  def show
  	@company = Company.find(params[:company_id])
  	@branch = @company.branches.find(params[:id])
  end

  def edit
  	@company = Company.find(params[:company_id])
  	@branch = @company.branches.find(params[:id])
  end

  def create
  	@company = Company.find(params[:company_id])
  	@branch  = @company.branches.create(branch_params)
  	
  	redirect_to company_branch_path(@company, @branch)
  end

  def index
  	@company = Company.find(params[:company_id])
  	@branches = @company.branches.all
  end

  private

    def branch_params
      params.require(:branch).permit(:company_id, :alias, :cep, :number, :street_address, :neighborhood, :city, :uf, :country, :complement)
    end
end

