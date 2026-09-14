require "test_helper"

class CapitalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capital = capitals(:one)
  end

  test "should get index" do
    get capitals_url, as: :json
    assert_response :success
  end

  test "should create capital" do
    assert_difference("Capital.count") do
      post capitals_url, params: { capital: { end_date: @capital.end_date, enddate_approximate: @capital.enddate_approximate, name: @capital.name, political_era_id: @capital.political_era_id, start_date: @capital.start_date, startdate_approximate: @capital.startdate_approximate } }, as: :json
    end

    assert_response :created
  end

  test "should show capital" do
    get capital_url(@capital), as: :json
    assert_response :success
  end

  test "should update capital" do
    patch capital_url(@capital), params: { capital: { end_date: @capital.end_date, enddate_approximate: @capital.enddate_approximate, name: @capital.name, political_era_id: @capital.political_era_id, start_date: @capital.start_date, startdate_approximate: @capital.startdate_approximate } }, as: :json
    assert_response :success
  end

  test "should destroy capital" do
    assert_difference("Capital.count", -1) do
      delete capital_url(@capital), as: :json
    end

    assert_response :no_content
  end
end
