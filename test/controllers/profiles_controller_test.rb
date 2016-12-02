require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest

  test "can get edit for own profile" do
    post session_path, params: {email: "hagrid@thehutt.com", password: "password"}
    get edit_profile_path(users(:hagrid).id)
    assert_response :success
    assert_select "form"
  end

end
