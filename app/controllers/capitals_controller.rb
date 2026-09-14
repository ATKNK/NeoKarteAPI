class CapitalsController < ApplicationController
  before_action :set_capital, only: %i[ show update destroy ]

  # GET /capitals
  def index
    @capitals = Capital.all

    render json: @capitals
  end

  # GET /capitals/1
  def show
    render json: @capital
  end

  # POST /capitals
  def create
    @capital = Capital.new(capital_params)

    if @capital.save
      render json: @capital, status: :created, location: @capital
    else
      render json: @capital.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /capitals/1
  def update
    if @capital.update(capital_params)
      render json: @capital
    else
      render json: @capital.errors, status: :unprocessable_content
    end
  end

  # DELETE /capitals/1
  def destroy
    @capital.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capital
      @capital = Capital.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def capital_params
      params.expect(capital: [ :name, :start_date, :end_date, :political_era_id, :startdate_approximate, :enddate_approximate ])
    end
end
