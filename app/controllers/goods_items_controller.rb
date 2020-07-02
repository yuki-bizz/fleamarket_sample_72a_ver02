class GoodsItemsController < ApplicationController

  def index
    @goods_items = Item.order('id DESC').limit(3)
  end

before_action :set_goods_item

  def show
  end
  
  # 商品出品機能との連携が必要か！？
  def new
    @goods_item = GoodsItem.new
  end

  # 商品出品機能との連携が必要か！？
  def create
    @goods_item = Goods_Item.new(goods_item_params)
    if @goods_item.save
      redirect_to action: :index
    end
  end

  def purchase
    @goods_item = GoodsItem.find(params[:id])
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    charge = Payjp::Charge.create(
      amount: @goods_item.selling_price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  #def pay
  #end

  private

  def goods_item_params
    params.require(:goods_item).permit(
      :name,
      :selling_price,
    ).merge(user_id: current_user.id)
  end

end

  def destroy
    goods_item.destroy
  end

  def edit
  end

  private

  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

end
