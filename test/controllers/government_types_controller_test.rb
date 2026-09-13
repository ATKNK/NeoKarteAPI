require "test_helper"

class GovernmentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @government_type = government_types(:one)
  end

  test "should get index" do
    get government_types_url, as: :json
    assert_response :success
  end

  test "should create government_type" do
    assert_difference("GovernmentType.count") do
      post government_types_url, params: { government_type: { name: @government_type.name } }, as: :json
    end

    assert_response :created
  end

  test "should show government_type" do
    get government_type_url(@government_type), as: :json
    assert_response :success
  end

  test "should update government_type" do
    patch government_type_url(@government_type), params: { government_type: { name: @government_type.name } }, as: :json
    assert_response :success
  end

  test "should destroy government_type" do
    assert_difference("GovernmentType.count", -1) do
      delete government_type_url(@government_type), as: :json
    end

    assert_response :no_content
  end
end
