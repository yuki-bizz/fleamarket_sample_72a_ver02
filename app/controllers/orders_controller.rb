class OrdersController < ApplicationController

  require 'payjp'

  before_action :sign_in_required
  before_action :set_card, only: [:goods_confirm, :pay]
  before_action :set_goods_item

  # def show
  #   @image_top = @goods_item.images.first
  # end

  def goods_confirm
    @image_top = @goods_item.images.first
    @set_card = Card.where(user_id: current_user.id)
    @card = @set_card.first
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = @set_card.first
    if @card.blank?
      redirect_to controller: "cards", action: "new" and return
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
        :amount => @goods_item.selling_price,
        :customer => @card.customer_id,
        :currency => 'jpy'
      )
    end
    @goods_item.update!( buyer_id: current_user.id)
    redirect_to action: 'done', goods_item_id: @goods_item and return

    rescue Payjp::CardError
      respond_to do |format|
        format.html{ redirect_to new_card_path, alert: 'カード情報にエラーがありました。有効期限や限度額をお確かめください。'}
      end

  end

  def done
    @top_image = @goods_item.images.first
    Order.create(goods_item_id: @goods_item.id, user_id: current_user.id)
  end

  private

  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

  def set_card
    @set_card = Card.where(user_id: current_user.id)
  end

  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

end
