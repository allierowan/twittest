class PostsController < ApplicationController
  load_and_authorize_resource

  def new
    @user = current_user
    @post = @user.posts.new()
  end

  def create
    @user = User.find(params[:user_id])
    if @user.posts.create(post_params)
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def index
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
