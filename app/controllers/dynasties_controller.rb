class DynastiesController < ApplicationController
  before_action :set_dynasty, only: %i[ show update destroy ]

  # GET /dynasties
  def index
    @dynasties = Dynasty.all

    render json: @dynasties
  end

  # GET /dynasties/1
  def show
    render json: @dynasty
  end

  # POST /dynasties
  def create
    @dynasty = Dynasty.new(dynasty_params)

    if @dynasty.save
      render json: @dynasty, status: :created, location: @dynasty
    else
      render json: @dynasty.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /dynasties/1
  def update
    if @dynasty.update(dynasty_params)
      render json: @dynasty
    else
      render json: @dynasty.errors, status: :unprocessable_content
    end
  end

  # DELETE /dynasties/1
  def destroy
    @dynasty.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dynasty
      @dynasty = Dynasty.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def dynasty_params
      params.expect(dynasty: [ :name ])
    end
end
