class GovtTypesController < ApplicationController
  before_action :set_govt_type, only: %i[ show update destroy ]

  # GET /govt_types
  def index
    @govt_types = GovtType.all

    render json: @govt_types
  end

  # GET /govt_types/1
  def show
    render json: @govt_type
  end

  # POST /govt_types
  def create
    @govt_type = GovtType.new(govt_type_params)

    if @govt_type.save
      render json: @govt_type, status: :created, location: @govt_type
    else
      render json: @govt_type.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /govt_types/1
  def update
    if @govt_type.update(govt_type_params)
      render json: @govt_type
    else
      render json: @govt_type.errors, status: :unprocessable_content
    end
  end

  # DELETE /govt_types/1
  def destroy
    @govt_type.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_govt_type
      @govt_type = GovtType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def govt_type_params
      params.expect(govt_type: [ :name ])
    end
end
