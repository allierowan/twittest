require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "can't get new if not logged in" do
    get new_user_post_path(users(:hagrid))
    assert_redirected_to root_path
    assert_equal "You are not authorized to access this page.", flash[:danger]
  end

  test "can't post new if not logged in" do
    post user_posts_path(users(:hagrid)), params: { post: { body: "Good stuff" } }
    assert_redirected_to root_path
    assert_equal "You are not authorized to access this page.", flash[:danger]
  end

  test "can get new if logged in" do
    post session_path, params: { user_name: "pink_umbrella", password: "password"}
    get new_user_post_path(users(:hagrid))
    assert_response :success
    assert_select "form"
  end

  test "can post if logged in" do
    post session_path, params: { user_name: "pink_umbrella", password: "password"}
    post user_posts_path(users(:hagrid)), params: { post: { body: "Good stuff" } }
    assert_redirected_to posts_path
    assert_equal "Good stuff", Post.last.body
  end

  test "can edit own post" do
    hagrid = users(:hagrid)
    post = posts(:one)
    post session_path, params: { user_name: "pink_umbrella", password: "password"}
    get edit_user_post_path(hagrid.id, post.id)
    assert_response :success
    assert_select "form"
  end

  test "can't edit someone else's post" do
    post session_path, params: { user_name: "big_dawg", password: "password"}
    get edit_user_post_path(users(:hagrid).id, posts(:one).id)
    assert_redirected_to root_path
    assert_equal "You are not authorized to access this page.", flash[:danger]
  end

  test "can delete own post" do
    post session_path, params: { user_name: "pink_umbrella", password: "password"}
    hagrid = users(:hagrid)
    post = posts(:one)
    delete user_post_path(hagrid.id, post.id)
    refute Post.find_by(id: post.id)
  end

  test "can't delete someone else's post" do
    post session_path, params: { user_name: "big_dawg", password: "password"}
    hagrid = users(:hagrid)
    post = posts(:one)
    delete user_post_path(hagrid.id, post.id)
    assert_redirected_to root_path
    assert_equal "You are not authorized to access this page.", flash[:danger]
  end
end
