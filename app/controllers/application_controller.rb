class ApplicationController < ActionController::Base
  # before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :delivery_family_name, :delivery_first_name, :delivery_family_name_kana, :delivery_first_name_kana, :postcode, :province, :city, :address1, :address2, :tellphone_number])
  end
  

  private

  # 本番環境のみBasic認証を行う
  # def production?
  #   Rails.env.production?
  # end
  
  # Basic認証実装
  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end

 


end
