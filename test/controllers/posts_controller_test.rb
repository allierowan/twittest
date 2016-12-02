require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "should get users posts index" do
    get user_posts_path(users(:hagrid))
    assert_match(/forbidden forest/, response.body)
  end

  test "should get new" do
    get new_user_post_path(users(:hagrid))
    assert_response :success
    assert_select "form"
  end

end
