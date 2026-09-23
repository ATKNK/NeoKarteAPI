require "test_helper"

class FlagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flag = flags(:one)
  end

  test "should get index" do
    get flags_url, as: :json
    assert_response :success
  end

  test "should create flag" do
    assert_difference("Flag.count") do
      post flags_url, params: { flag: { end_date: @flag.end_date, political_era_id: @flag.political_era_id, start_date: @flag.start_date } }, as: :json
    end

    assert_response :created
  end

  test "should show flag" do
    get flag_url(@flag), as: :json
    assert_response :success
  end

  test "should update flag" do
    patch flag_url(@flag), params: { flag: { end_date: @flag.end_date, political_era_id: @flag.political_era_id, start_date: @flag.start_date } }, as: :json
    assert_response :success
  end

  test "should destroy flag" do
    assert_difference("Flag.count", -1) do
      delete flag_url(@flag), as: :json
    end

    assert_response :no_content
  end
end
