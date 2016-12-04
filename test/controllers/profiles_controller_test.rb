require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest

  test "can get edit for own profile" do
    post session_path, params: { user_name: "pink_umbrella", password: "password" }
    get edit_profile_path(users(:hagrid).id)
    assert_response :success
    assert_select "form"
  end

  test "can get edit password for own profile" do
    post session_path, params: { user_name: "pink_umbrella", password: "password" }
    get edit_password_path(users(:hagrid).id)
    assert_response :success
    assert_select "form"
  end

  test "can't edit profile of another user" do
    post session_path, params: { user_name: "pink_umbrella", password: "password" }
    get edit_profile_path(users(:fang).id)
    assert_response :redirect
    assert_equal "You are not authorized to access this page.", flash[:danger]
  end

  test "can edit own profile info" do
    hagrid_id = users(:hagrid).id
    post session_path, params: { user_name: "pink_umbrella", password: "password" }
    patch profile_path(hagrid_id), params: { user: { email: "hagrid@hogwarts.com" } }
    assert_response :redirect
    assert_equal "hagrid@hogwarts.com", User.find(hagrid_id).email
  end
end
