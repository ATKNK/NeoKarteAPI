class PoliticalErasController < ApplicationController

  before_action :set_country, only: %i[ index_by_tag show_by_year ]
  before_action :set_political_era, only: %i[ show update destroy ]

  # GET /political_eras
  def index
    @political_eras = Country.find(params[:country_id]).political_eras.includes(:flags)

    render json: political_eras_json(@political_eras)
  end

  def index_by_tag
    @political_eras = @country.political_eras.includes(:flags)
    render json: political_eras_json(@political_eras)
  end

  # GET /political_eras/1
  def show
    render json: political_era_json(@political_era)
  end

  # GET /political_eras/1/date=1444-11-11
  def show_by_year
    @political_era = @country.political_eras.includes(:flags).where("start_date <= ? AND end_date >= ?", params[:selected_date], params[:selected_date]).all

    render json: political_eras_json(@political_era, selected_date: params[:selected_date])
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

    def set_country
      @country = if params[:tag]
        Country.find_by!(tag: params.expect(:tag))
      else
        Country.find(params.expect(:country_id))
      end
    end

    def political_eras_json(political_eras, selected_date: nil)
      political_eras.map { |political_era| political_era_json(political_era, selected_date:) }
    end

    def political_era_json(political_era, selected_date: nil)
      flags = political_era.flags
      if selected_date
        flags = flags.where("start_date <= ? AND end_date >= ?", selected_date, selected_date)
      end
      flag = flags.order(:start_date).first

      political_era.as_json.merge(
        flag: flag&.as_json&.merge(
          image: flag.image.attached? ? url_for(flag.image) : nil
        )
      )
    end

    # Only allow a list of trusted parameters through.
    def political_era_params
      params.expect(political_era: [ :name, :country_id, :start_date, :end_date, :full_name, :full_name_local, :dynasty_id, :government_type_id, :startdate_approximate, :enddate_approximate ])
    end
end
