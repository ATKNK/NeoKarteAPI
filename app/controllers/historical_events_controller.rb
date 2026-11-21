class HistoricalEventsController < ApplicationController
  before_action :set_historical_event, only: %i[ show update destroy ]

  # GET /historical_events
  def index
    @historical_events = HistoricalEvent.includes(event_images: { image_attachment: :blob })

    render json: @historical_events.map { |historical_event| historical_event_json(historical_event) }
  end

  def show_by_date
    selected_date = params.expect(:selected_date)
    @historical_events = HistoricalEvent.includes(event_images: { image_attachment: :blob }).where(
      "start_date <= ? AND (end_date IS NULL OR end_date >= ?)",
      selected_date,
      selected_date
    )

    render json: @historical_events.map { |historical_event| historical_event_json(historical_event) }
  end

  # GET /historical_events/1
  def show
    render json: historical_event_json(@historical_event)
  end

  # POST /historical_events
  def create
    @historical_event = HistoricalEvent.new(historical_event_params)

    if @historical_event.save
      render json: historical_event_json(@historical_event), status: :created, location: @historical_event
    else
      render json: @historical_event.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /historical_events/1
  def update
    if @historical_event.update(historical_event_params)
      render json: historical_event_json(@historical_event)
    else
      render json: @historical_event.errors, status: :unprocessable_content
    end
  end

  # DELETE /historical_events/1
  def destroy
    @historical_event.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historical_event
      @historical_event = HistoricalEvent.includes(event_images: { image_attachment: :blob }).find(params.expect(:id))
    end

    def historical_event_json(historical_event)
      historical_event.as_json.merge(
        event_images: historical_event.event_images.map do |event_image|
          event_image.as_json.merge(
            image: event_image.image.attached? ? url_for(event_image.image) : nil
          )
        end
      )
    end

    # Only allow a list of trusted parameters through.
    def historical_event_params
      params.expect(historical_event: [ :name, :location, :latitude, :longitude, :start_date, :end_date, :startdate_approximate, :enddate_approximate, :description ])
    end
end
