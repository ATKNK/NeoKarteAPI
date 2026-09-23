class FlagsController < ApplicationController
  before_action :set_flag, only: %i[ show update destroy ]

  # GET /flags
  def index
    @flags = Flag.all

    render json: @flags
  end

  # GET /flags/1
  def show
    @flag = Flag.find(params.expect(:id))
    render json: @flag.as_json.merge(
      image: @flag.image.attached? ? url_for(@flag.image) : nil
    )
  end

  # POST /flags
  def create
    @flag = Flag.new(flag_params)

    if @flag.save
      render json: @flag, status: :created, location: @flag
    else
      render json: @flag.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /flags/1
  def update
    if @flag.update(flag_params)
      render json: @flag
    else
      render json: @flag.errors, status: :unprocessable_content
    end
  end

  # DELETE /flags/1
  def destroy
    @flag.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flag
      @flag = Flag.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def flag_params
      params.expect(flag: [ :start_date, :end_date, :political_era_id, :image ])
    end
end
