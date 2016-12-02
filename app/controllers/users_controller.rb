class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      UserMailer.sign_up_email(@user).deliver_now
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :user_name, :password, :password_confirmation)
  end
end
