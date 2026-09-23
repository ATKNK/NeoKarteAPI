class CountriesController < ApplicationController

  before_action :set_country_by_tag, only: %i[ show_by_tag ]

  before_action :set_country, only: %i[ show update destroy ]

  # GET /countries
  def index
    @countries = Country.all

    render json: @countries
  end

  # GET /countries/1
  def show
    render json: @country
  end

  def show_by_tag
    render json: @country
  end

  # POST /countries
  def create
    @country = Country.new(country_params)

    if @country.save
      render json: @country, status: :created, location: @country
    else
      render json: @country.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /countries/1
  def update
    if @country.update(country_params)
      render json: @country
    else
      render json: @country.errors, status: :unprocessable_content
    end
  end

  # DELETE /countries/1
  def destroy
    @country.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params.expect(:id))
    end

    def set_country_by_tag
      @country = Country.find_by!(tag: params.expect(:tag))
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.expect(country: [ :tag, :name ])
    end
end
