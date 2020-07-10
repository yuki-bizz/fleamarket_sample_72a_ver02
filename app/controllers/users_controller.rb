class UsersController < ApplicationController
  before_action :check_user

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def check_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

end
