class UsersController < ApplicationController
  before_action :check_user

  def show
    @user = User.find(params[:id])
  end

  private

   def check_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

end
