require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "creates a user and starts a session" do
    token = csrf_token

    assert_difference("User.count", 1) do
      post users_url,
        params: {
          user: {
            email_address: "person@example.com",
            password: "password123",
            password_confirmation: "password123"
          }
        },
        headers: { "X-CSRF-Token" => token },
        as: :json
    end

    assert_response :created
    assert_equal "person@example.com", response.parsed_body["email_address"]
    refute response.parsed_body.key?("password_digest")

    get session_url, as: :json
    assert_response :success
  end

  test "authenticates, reports, and clears the current session" do
    user = User.create!(
      email_address: "person@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    token = csrf_token

    post session_url,
      params: { email_address: user.email_address, password: "password123" },
      headers: { "X-CSRF-Token" => token },
      as: :json

    assert_response :success
    assert_equal user.id, response.parsed_body["id"]

    get session_url, as: :json
    assert_response :success

    token = csrf_token
    delete session_url, headers: { "X-CSRF-Token" => token }, as: :json
    assert_response :no_content

    get session_url, as: :json
    assert_response :unauthorized
  end

  test "rejects invalid credentials" do
    user = User.create!(
      email_address: "person@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    post session_url,
      params: { email_address: user.email_address, password: "wrong-password" },
      headers: { "X-CSRF-Token" => csrf_token },
      as: :json

    assert_response :unauthorized
  end

  private

  def csrf_token
    get csrf_token_url, as: :json
    assert_response :success
    response.parsed_body.fetch("token")
  end
end
