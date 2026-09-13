class GovernmentTypesController < ApplicationController
  before_action :set_government_type, only: %i[ show update destroy ]

  # GET /government_types
  def index
    @government_types = GovernmentType.all

    render json: @government_types
  end

  # GET /government_types/1
  def show
    render json: @government_type
  end

  # POST /government_types
  def create
    @government_type = GovernmentType.new(government_type_params)

    if @government_type.save
      render json: @government_type, status: :created, location: @government_type
    else
      render json: @government_type.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /government_types/1
  def update
    if @government_type.update(government_type_params)
      render json: @government_type
    else
      render json: @government_type.errors, status: :unprocessable_content
    end
  end

  # DELETE /government_types/1
  def destroy
    @government_type.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_government_type
      @government_type = GovernmentType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def government_type_params
      params.expect(government_type: [ :name ])
    end
end
