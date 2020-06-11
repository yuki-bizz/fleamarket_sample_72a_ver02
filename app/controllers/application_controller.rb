class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  
  

  private

  # 本番環境のみBasic認証を行う
  def production?
    Rails.env.production?
  end
  
  # Basic認証実装
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

 
############## devise周り add kazoe ##############
  # ログインしていなければログインページヘリダイレクト
  #  def sign_in_required
  #    redirect_to new_user_session_url unless user_signed_in?
  #  end

  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    user_session_path # ログアウト後に遷移するpathを設定
  end
############## devise周り add kazoe ##############


end
