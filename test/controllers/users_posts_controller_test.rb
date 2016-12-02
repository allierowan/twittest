require 'test_helper'

class UsersPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get users posts index" do
    get users_posts_path(users(:hagrid).id)
    assert_match(/forbidden forest/, response.body)
  end

end
