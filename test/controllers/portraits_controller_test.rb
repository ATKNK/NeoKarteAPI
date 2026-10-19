require "test_helper"

class PortraitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portrait = portraits(:one)
  end

  test "should get index" do
    @portrait.image.attach(
      io: StringIO.new("portrait image"),
      filename: "portrait.png",
      content_type: "image/png"
    )

    get portraits_url, as: :json

    assert_response :success
    assert_match %r{/rails/active_storage/blobs/}, response.parsed_body.first.fetch("image")
  end

  test "should create portrait" do
    assert_difference("Portrait.count") do
      post portraits_url, params: { portrait: { ruler_id: @portrait.ruler_id } }, as: :json
    end

    assert_response :created
  end

  test "should show portrait" do
    @portrait.image.attach(
      io: StringIO.new("portrait image"),
      filename: "portrait.png",
      content_type: "image/png"
    )

    get portrait_url(@portrait), as: :json

    assert_response :success
    assert_match %r{/rails/active_storage/blobs/}, response.parsed_body.fetch("image")
  end

  test "should update portrait" do
    patch portrait_url(@portrait), params: { portrait: { ruler_id: @portrait.ruler_id } }, as: :json
    assert_response :success
  end

  test "should destroy portrait" do
    assert_difference("Portrait.count", -1) do
      delete portrait_url(@portrait), as: :json
    end

    assert_response :no_content
  end
end
