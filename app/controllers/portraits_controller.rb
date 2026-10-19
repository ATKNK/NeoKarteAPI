class PortraitsController < ApplicationController
  before_action :set_portrait, only: %i[ show update destroy ]

  # GET /portraits
  def index
    @portraits = Portrait.with_attached_image

    render json: @portraits.map { |portrait| portrait_json(portrait) }
  end

  # GET /portraits/1
  def show
    render json: portrait_json(@portrait)
  end

  # POST /portraits
  def create
    @portrait = Portrait.new(portrait_params)

    if @portrait.save
      render json: @portrait, status: :created, location: @portrait
    else
      render json: @portrait.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /portraits/1
  def update
    if @portrait.update(portrait_params)
      render json: @portrait
    else
      render json: @portrait.errors, status: :unprocessable_content
    end
  end

  # DELETE /portraits/1
  def destroy
    @portrait.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portrait
      @portrait = Portrait.find(params.expect(:id))
    end

    def portrait_json(portrait)
      portrait.as_json.merge(
        image: portrait.image.attached? ? url_for(portrait.image) : nil
      )
    end

    # Only allow a list of trusted parameters through.
    def portrait_params
      params.expect(portrait: [ :ruler_id, :image])
    end
end
