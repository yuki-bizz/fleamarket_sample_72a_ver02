class CardsController < ApplicationController
  
  require "payjp"

  before_action :sign_in_required

  def new
    # sessionにひとつ前のリファラーをいれる # URLを保存する処理
    session[:previous_url] = request.referer
    
    @card = Card.where(user_id: current_user.id) 
    redirect_to action: "show" if @card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      email: current_user.email, 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)

      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    # sessionをクリア
    session[:previous_url].clear

    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      @customer = Payjp::Customer.retrieve(@card.customer_id)
      @customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end

  def show 
    # sessionの中からURLを取り出してリダイレクトさせる
    @session = session[:previous_url]

    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

end