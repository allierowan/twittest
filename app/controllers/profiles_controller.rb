class ProfilesController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def edit_password
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    elsif params[:user][:password]
      render :edit_password
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :user_name, :password, :password_confirmation)
  end
end
