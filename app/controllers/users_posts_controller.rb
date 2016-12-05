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

  def start_page_count
    if current_page < 4
      0
    else
      current_page - 4
    end
  end

  def num_page_links
    if total_pages == 1
      0
    elsif total_pages < 10
      total_pages
    elsif (total_pages - current_page) < 5
      4 + (total_pages - current_page)
    else
      10
    end
  end

  helper_method :current_page
  helper_method :total_pages
  helper_method :start_page_count
  helper_method :num_page_links
end
