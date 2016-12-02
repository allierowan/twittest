class UsersPostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts.reverse
  end
end
