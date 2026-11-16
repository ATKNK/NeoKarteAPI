require "test_helper"

class EventImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_image = event_images(:one)
  end

  test "should get index" do
    get event_images_url, as: :json
    assert_response :success
  end

  test "should create event_image" do
    assert_difference("EventImage.count") do
      post event_images_url, params: {
        event_image: {
          historical_event_id: @event_image.historical_event_id,
          image: uploaded_image
        }
      }
    end

    assert_response :created
    assert EventImage.order(:id).last.image.attached?
    assert_match %r{/rails/active_storage/blobs/}, response.parsed_body.fetch("image")
  end

  test "should show event_image" do
    @event_image.image.attach(
      io: StringIO.new("event image"),
      filename: "event.png",
      content_type: "image/png"
    )

    get event_image_url(@event_image), as: :json

    assert_response :success
    assert_match %r{/rails/active_storage/blobs/}, response.parsed_body.fetch("image")
  end

  test "should update event_image" do
    patch event_image_url(@event_image), params: { event_image: { historical_event_id: @event_image.historical_event_id } }, as: :json
    assert_response :success
  end

  test "should destroy event_image" do
    assert_difference("EventImage.count", -1) do
      delete event_image_url(@event_image), as: :json
    end

    assert_response :no_content
  end

  private

  def uploaded_image
    ActionDispatch::Http::UploadedFile.new(
      tempfile: StringIO.new("event image"),
      filename: "event.png",
      type: "image/png"
    )
  end
end
