class UsersPostsController < ApplicationController
  def index
    @per_page = 20.0
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc).limit(@per_page).offset(@per_page * current_page)
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
    (Post.where(user_id: @user.id).count / @per_page).ceil
  end

  helper_method :current_page
  helper_method :total_pages
end
