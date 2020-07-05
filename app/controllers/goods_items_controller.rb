class GoodsItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goods_item, only: [:show, :edit]

  def index
    @goods_items = GoodsItem.includes(:images).order('created_at DESC')
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @goods_item = GoodsItem.new
    @goods_item.images.new
    @parents = Category.where(ancestry: nil)
  end

  def create
    @goods_item = GoodsItem.new(goods_item_params)
    
    if @goods_item.save
      redirect_to goods_items_path
    else
      render :new
    end

  end

  def show
  end

  def destroy
    goods_item.destroy
  end

  def edit
  end

  private

  def goods_item_params
    params.require(:goods_item).permit(:name, :price, :explanation, :category, :brand, :condition_id, :shipping_fee_id, :province_id, :delivery_date_id, :delivery_way_id, :selling_price, :status, :seller_id, images_attributes: [:src]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end

  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

end

