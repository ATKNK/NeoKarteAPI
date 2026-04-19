require "test_helper"

class DynastiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dynasty = dynasties(:one)
  end

  test "should get index" do
    get dynasties_url, as: :json
    assert_response :success
  end

  test "should create dynasty" do
    assert_difference("Dynasty.count") do
      post dynasties_url, params: { dynasty: { name: @dynasty.name } }, as: :json
    end

    assert_response :created
  end

  test "should show dynasty" do
    get dynasty_url(@dynasty), as: :json
    assert_response :success
  end

  test "should update dynasty" do
    patch dynasty_url(@dynasty), params: { dynasty: { name: @dynasty.name } }, as: :json
    assert_response :success
  end

  test "should destroy dynasty" do
    assert_difference("Dynasty.count", -1) do
      delete dynasty_url(@dynasty), as: :json
    end

    assert_response :no_content
  end
end
