class UsersController < ApplicationController
  before_action :check_user

  add_breadcrumb 'TOP', :root

  def show
    @user = User.find(params[:id])
    add_breadcrumb 'マイページ', "/users/#{current_user.id}"
  end

  def edit
    @user = User.find(params[:id])
    add_breadcrumb 'マイページ（アカウントの編集）', "/users/#{current_user.id}"
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
      @phone_number.save(context: :phone_number_validates)
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
