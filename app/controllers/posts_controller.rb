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
    @user = current_user
    @post = Post.find(params[:id])
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def index
    @posts = Post.all.reverse
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
