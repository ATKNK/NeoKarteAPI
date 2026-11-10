class HistoricalEventsController < ApplicationController
  before_action :set_historical_event, only: %i[ show update destroy ]

  # GET /historical_events
  def index
    @historical_events = HistoricalEvent.all

    render json: @historical_events
  end

  # GET /historical_events/1
  def show
    render json: @historical_event
  end

  # POST /historical_events
  def create
    @historical_event = HistoricalEvent.new(historical_event_params)

    if @historical_event.save
      render json: @historical_event, status: :created, location: @historical_event
    else
      render json: @historical_event.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /historical_events/1
  def update
    if @historical_event.update(historical_event_params)
      render json: @historical_event
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
      @historical_event = HistoricalEvent.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def historical_event_params
      params.expect(historical_event: [ :name, :location, :latitude, :longitude, :start_date, :end_date, :startdate_approximate, :enddate_approximate ])
    end
end
