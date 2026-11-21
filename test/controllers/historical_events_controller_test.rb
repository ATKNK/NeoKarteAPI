require "test_helper"

class HistoricalEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historical_event = historical_events(:one)
  end

  test "should get index" do
    get historical_events_url, as: :json
    assert_response :success
  end

  test "should get historical events active on the selected date" do
    selected_date = Date.new(2026, 11, 9)
    active_event = HistoricalEvent.create!(
      name: "Evento durante a data selecionada",
      start_date: selected_date - 2.days,
      end_date: selected_date + 2.days
    )
    event_starting_later = HistoricalEvent.create!(
      name: "Evento futuro",
      start_date: selected_date + 1.day,
      end_date: selected_date + 3.days
    )
    expired_event = HistoricalEvent.create!(
      name: "Evento encerrado",
      start_date: selected_date - 3.days,
      end_date: selected_date - 1.day
    )

    get "/api/historical_events/show_by_date", params: { selected_date: }, as: :json

    assert_response :success
    assert_equal [active_event.id], response.parsed_body.map { |event| event["id"] }
    refute_includes response.parsed_body.map { |event| event["id"] }, event_starting_later.id
    refute_includes response.parsed_body.map { |event| event["id"] }, expired_event.id
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
