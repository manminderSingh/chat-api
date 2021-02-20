require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get authentication_auth_url
    assert_response :success
  end
end
