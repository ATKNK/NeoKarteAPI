require "test_helper"

class GovtTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @govt_type = govt_types(:one)
  end

  test "should get index" do
    get govt_types_url, as: :json
    assert_response :success
  end

  test "should create govt_type" do
    assert_difference("GovtType.count") do
      post govt_types_url, params: { govt_type: { name: @govt_type.name } }, as: :json
    end

    assert_response :created
  end

  test "should show govt_type" do
    get govt_type_url(@govt_type), as: :json
    assert_response :success
  end

  test "should update govt_type" do
    patch govt_type_url(@govt_type), params: { govt_type: { name: @govt_type.name } }, as: :json
    assert_response :success
  end

  test "should destroy govt_type" do
    assert_difference("GovtType.count", -1) do
      delete govt_type_url(@govt_type), as: :json
    end

    assert_response :no_content
  end
end
