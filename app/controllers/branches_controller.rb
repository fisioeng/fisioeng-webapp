class BranchesController < InheritedResources::Base
  before_action :authenticate_user!
  respond_to :html, :xml, :json

  belongs_to :company

  def show
    @company = Company.find(params[:company_id])
    @branch = Branch.find(params[:id])
    @analytes = @branch.analytes
  end

  private

    def branch_params
      params.require(:branch).permit(:company_id, :alias, :cep, :number, :street_address, :neighborhood, :city, :uf, :country, :complement)
    end
end

