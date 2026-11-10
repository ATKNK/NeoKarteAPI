require "test_helper"

class HistoricalEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historical_event = historical_events(:one)
  end

  test "should get index" do
    get historical_events_url, as: :json
    assert_response :success
  end

  test "should create historical_event" do
    assert_difference("HistoricalEvent.count") do
      post historical_events_url, params: { historical_event: { end_date: @historical_event.end_date, enddate_approximate: @historical_event.enddate_approximate, latitude: @historical_event.latitude, location: @historical_event.location, longitude: @historical_event.longitude, name: @historical_event.name, start_date: @historical_event.start_date, startdate_approximate: @historical_event.startdate_approximate } }, as: :json
    end

    assert_response :created
  end

  test "should show historical_event" do
    get historical_event_url(@historical_event), as: :json
    assert_response :success
  end

  test "should update historical_event" do
    patch historical_event_url(@historical_event), params: { historical_event: { end_date: @historical_event.end_date, enddate_approximate: @historical_event.enddate_approximate, latitude: @historical_event.latitude, location: @historical_event.location, longitude: @historical_event.longitude, name: @historical_event.name, start_date: @historical_event.start_date, startdate_approximate: @historical_event.startdate_approximate } }, as: :json
    assert_response :success
  end

  test "should destroy historical_event" do
    assert_difference("HistoricalEvent.count", -1) do
      delete historical_event_url(@historical_event), as: :json
    end

    assert_response :no_content
  end
end
