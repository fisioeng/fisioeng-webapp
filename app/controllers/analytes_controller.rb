class AnalytesController < InheritedResources::Base
  before_action :authenticate_user!
  before_action :set_company, :set_branch
  before_action :set_analyte, only: [:show, :edit, :update, :destroy]
  before_action :setter_profiles, only: [:new, :edit]

  respond_to :html, :xml, :json

  belongs_to :company do
    belongs_to :branch
  end

  def show
    @samplings = @analyte.samplings.order(:updated_at).page(params[:page])
  end

  def create
    @analyte = Analyte.new(analyte_params)

    @analyte.branch = @branch
    @analyte.specie_profile = SpecieProfile.find(params[:specie_profile_id])

    respond_to do |format|
      if @analyte.save
        format.html { redirect_to company_branch_analyte_path(@company, @branch, @analyte), notice: 'Analyte was successfully created.' }
        format.json { render :show, status: :created, location: @analyte }
      else
        format.html { render :new }
        format.json { render json: @analyte.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @analyte.specie_profile = SpecieProfile.find(params[:specie_profile_id])
    respond_to do |format|
      if @analyte.update(analyte_params)
        format.html { redirect_to company_branch_analyte_path(@company, @branch, @analyte), notice: 'Analyte was successfully updated.' }
        format.json { render :show, status: :ok, location: @analyte }
      else
        format.html { render :edit }
        format.json { render json: @analyte.errors, status: :unprocessable_entity }
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
      @analyte = @branch.analytes.find(params[:id])
    end

    def analyte_params
      params.require(:analyte).permit(:branch_id, :specie_profile_id, :code, :name, :birthdate, :weight, :lanado, :color)
    end

    def setter_profiles
      profiles = SpecieProfile.all
      @profiles = [['Select a profile', nil]]

      profiles.each do |profile|
         @profiles << [profile.alias, profile.id]
      end
    end
end

