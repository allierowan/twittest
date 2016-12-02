class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @per_page = 20.0
    @posts = Post.order(created_at: :desc).limit(@per_page).offset(@per_page * current_page)
  end

  def current_page
    page = params[:page].to_i
    @page = if page < total_pages && page > 0
      page
    else
      0
    end
  end

  def total_pages
    (Post.count / @per_page).ceil
  end

  helper_method :current_page
  helper_method :total_pages

  def new
    @user = current_user
    @post = @user.posts.new()
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
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

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
