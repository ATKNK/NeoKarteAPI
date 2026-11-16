class EventImagesController < ApplicationController
  before_action :set_event_image, only: %i[ show update destroy ]

  # GET /event_images
  def index
    @event_images = EventImage.with_attached_image

    render json: @event_images.map { |event_image| event_image_json(event_image) }
  end

  # GET /event_images/1
  def show
    render json: event_image_json(@event_image)
  end

  # POST /event_images
  def create
    @event_image = EventImage.new(event_image_params)

    if @event_image.save
      render json: event_image_json(@event_image), status: :created, location: @event_image
    else
      render json: @event_image.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /event_images/1
  def update
    if @event_image.update(event_image_params)
      render json: event_image_json(@event_image)
    else
      render json: @event_image.errors, status: :unprocessable_content
    end
  end

  # DELETE /event_images/1
  def destroy
    @event_image.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_image
      @event_image = EventImage.find(params.expect(:id))
    end

    def event_image_json(event_image)
      event_image.as_json.merge(
        image: event_image.image.attached? ? url_for(event_image.image) : nil
      )
    end

    # Only allow a list of trusted parameters through.
    def event_image_params
      params.expect(event_image: [ :historical_event_id, :image ])
    end
end
