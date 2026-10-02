require "test_helper"

class RulersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ruler = rulers(:one)
  end

  test "should get index" do
    get rulers_url, as: :json
    assert_response :success
  end

  test "should create ruler" do
    assert_difference("Ruler.count") do
      post rulers_url, params: { ruler: { end: @ruler.end, enddate_approximate: @ruler.enddate_approximate, political_era_id: @ruler.political_era_id, person_id: @ruler.person_id, start: @ruler.start, startdate_approximate: @ruler.startdate_approximate } }, as: :json
    end

    assert_response :created
  end

  test "should show ruler" do
    get ruler_url(@ruler), as: :json
    assert_response :success
  end

  test "should update ruler" do
    patch ruler_url(@ruler), params: { ruler: { end: @ruler.end, enddate_approximate: @ruler.enddate_approximate, political_era_id: @ruler.political_era_id, person_id: @ruler.person_id, start: @ruler.start, startdate_approximate: @ruler.startdate_approximate } }, as: :json
    assert_response :success
  end

  test "should destroy ruler" do
    assert_difference("Ruler.count", -1) do
      delete ruler_url(@ruler), as: :json
    end

    assert_response :no_content
  end
end
