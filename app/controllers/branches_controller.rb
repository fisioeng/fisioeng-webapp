class BranchesController < InheritedResources::Base
  respond_to :html, :xml, :json

  belongs_to :company

  private

    def branch_params
      params.require(:branch).permit(:company_id, :alias, :cep, :number, :street_address, :neighborhood, :city, :uf, :country, :complement)
    end
end

