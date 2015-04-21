class SamplingsController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :setter, only: [:show, :edit, :update, :destroy]

  respond_to :html, :xml, :json

  def show
    @measures = @sampling.measures.order(:updated_at).page(params[:page])
  end

  private

    def sampling_params
      params.require(:sampling).permit(:analyte_id, :name)
    end

    def setter
      @company = Company.find(params[:company_id])
      @branch = Branch.find(params[:branch_id])
      @analyte = Analyte.find(params[:analyte_id])
      @sampling = Sampling.find(params[:id])
    end
end

