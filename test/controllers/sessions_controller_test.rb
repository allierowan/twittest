require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_path
    assert_response :success
    assert_select "form"
  end

  test "can create new session" do
    hagrid = users(:hagrid)
    post session_path, params: { user_name: "pink_umbrella", password: "password" }
    assert_redirected_to user_path(hagrid.id)
  end
end
