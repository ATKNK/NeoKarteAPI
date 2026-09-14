class PoliticalErasController < ApplicationController
  before_action :set_political_era, only: %i[ show update destroy ]

  # GET /political_eras
  def index
    @political_eras = PoliticalEra.all

    render json: @political_eras
  end

  # GET /political_eras/1
  def show
    render json: @political_era
  end

  # POST /political_eras
  def create
    @political_era = PoliticalEra.new(political_era_params)

    if @political_era.save
      render json: @political_era, status: :created, location: @political_era
    else
      render json: @political_era.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /political_eras/1
  def update
    if @political_era.update(political_era_params)
      render json: @political_era
    else
      render json: @political_era.errors, status: :unprocessable_content
    end
  end

  # DELETE /political_eras/1
  def destroy
    @political_era.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_political_era
      @political_era = PoliticalEra.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def political_era_params
      params.expect(political_era: [ :name, :country_id, :start_date, :end_date, :full_name, :full_name_local, :dynasty_id, :government_type_id, :startdate_approximate, :enddate_approximate ])
    end
end
