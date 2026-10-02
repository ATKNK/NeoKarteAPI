class RulersController < ApplicationController
  before_action :set_ruler, only: %i[ show update destroy ]

  # GET /rulers
  def index
    @rulers = Ruler.all

    render json: @rulers
  end

  # GET /rulers/1
  def show
    render json: @ruler
  end

  # POST /rulers
  def create
    @ruler = Ruler.new(ruler_params)

    if @ruler.save
      render json: @ruler, status: :created, location: @ruler
    else
      render json: @ruler.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /rulers/1
  def update
    if @ruler.update(ruler_params)
      render json: @ruler
    else
      render json: @ruler.errors, status: :unprocessable_content
    end
  end

  # DELETE /rulers/1
  def destroy
    @ruler.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruler
      @ruler = Ruler.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ruler_params
      params.expect(ruler: [ :political_era_id, :person_id, :start, :end, :startdate_approximate, :enddate_approximate ])
    end
end
