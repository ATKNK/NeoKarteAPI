require "test_helper"

class HistoricalEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historical_event = historical_events(:one)
  end

  test "should get index" do
    get historical_events_url, as: :json
    assert_response :success
  end

  test "should get historical events from the selected year" do
    selected_date = Date.new(1444, 11, 11)
    active_event = HistoricalEvent.create!(
      name: "Evento no ano selecionado",
      start_date: Date.new(1444, 11, 10),
      end_date: Date.new(1444, 11, 10)
    )
    event_spanning_years = HistoricalEvent.create!(
      name: "Evento entre anos",
      start_date: Date.new(1443, 12, 30),
      end_date: Date.new(1444, 1, 2)
    )
    event_from_next_year = HistoricalEvent.create!(
      name: "Evento do próximo ano",
      start_date: Date.new(1445, 1, 1),
      end_date: Date.new(1445, 1, 3)
    )

    get "/api/historical_events/show_by_year", params: { selected_date: }, as: :json

    assert_response :success
    event_ids = response.parsed_body.map { |event| event["id"] }
    assert_equal [active_event.id, event_spanning_years.id].sort, event_ids.sort
    refute_includes event_ids, event_from_next_year.id
  end

  test "should create historical_event" do
    assert_difference("HistoricalEvent.count") do
      post historical_events_url, params: { historical_event: { end_date: @historical_event.end_date, enddate_approximate: @historical_event.enddate_approximate, latitude: @historical_event.latitude, location: @historical_event.location, longitude: @historical_event.longitude, name: @historical_event.name, start_date: @historical_event.start_date, startdate_approximate: @historical_event.startdate_approximate, description: "Descrição do evento" } }, as: :json
    end

    assert_response :created
    assert_equal "Descrição do evento", response.parsed_body["description"]
  end

  test "should show historical_event" do
    event_image = @historical_event.event_images.create!
    event_image.image.attach(
      io: StringIO.new("event image"),
      filename: "event.png",
      content_type: "image/png"
    )

    get historical_event_url(@historical_event), as: :json

    assert_response :success
    assert_match %r{/rails/active_storage/blobs/}, response.parsed_body.fetch("event_images").first.fetch("image")
  end

  test "should update historical_event" do
    patch historical_event_url(@historical_event), params: { historical_event: { end_date: @historical_event.end_date, enddate_approximate: @historical_event.enddate_approximate, latitude: @historical_event.latitude, location: @historical_event.location, longitude: @historical_event.longitude, name: @historical_event.name, start_date: @historical_event.start_date, startdate_approximate: @historical_event.startdate_approximate, description: "Descrição atualizada" } }, as: :json
    assert_response :success
    assert_equal "Descrição atualizada", response.parsed_body["description"]
  end

  test "should destroy historical_event" do
    @historical_event.event_images.create!

    assert_difference("HistoricalEvent.count", -1) do
      delete historical_event_url(@historical_event), as: :json
    end

    assert_response :no_content
    assert_equal 0, EventImage.where(historical_event_id: @historical_event.id).count
  end
end
