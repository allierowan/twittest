class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end
end
