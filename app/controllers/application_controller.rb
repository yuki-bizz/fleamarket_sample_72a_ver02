class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  

  private
  # ログインしていなければログインページヘリダイレクト
  #  def sign_in_required
  #    redirect_to new_user_session_url unless user_signed_in?
  #  end
  


end
