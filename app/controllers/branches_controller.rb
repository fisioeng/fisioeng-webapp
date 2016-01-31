class BranchesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_company
  before_action :set_branch, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  belongs_to :company

  def index
    @branches = @company.branches
  end

  def show
    @analytes = @branch.analytes
  end

  private
    def set_company
      @company = current_user.companies.find(params[:company_id])
      unless @company
        raise ActionController::RoutingError.new('Not Found')
      end
    end

    def set_branch
      @branch = @company.branches.find(params[:id])
    end

    def branch_params
      params.require(:branch).permit(:alias, :cep, :number, :street_address, :neighborhood, :city, :uf, :country, :complement)
    end
end

