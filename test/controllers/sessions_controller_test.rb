require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get sessions_signup_url
    assert_response :success
  end
end
