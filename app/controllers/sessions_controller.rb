class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to new_session_path, flash: {danger: "Username or password was not correct."}
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to root_path
  end
end
