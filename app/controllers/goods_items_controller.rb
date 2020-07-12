class GoodsItemsController < ApplicationController
  before_action :set_goods_item, only: [:show, :edit, :update, :destroy]

  def check
    @goods_items = GoodsItem.includes(:images).order('created_at DESC')
  end

# 商品出品画面
  def new
    redirect_to new_user_session_path unless user_signed_in?
    @goods_item = GoodsItem.new
    @goods_item.images.new
    @parents = Category.where(ancestry: nil)
  end

# 商品保存機能
  def create
    @goods_item = GoodsItem.new(goods_item_params)   
    if @goods_item.save
      redirect_to action: :check
    else
      render :new
    end
  end

# 商品詳細ページ
 def show
 end

# 商品編集画面
 def edit
 end

# 商品更新機能
  def update
    if @goods_item.update(goods_item_params)
      redirect_to goods_item_path(@goods_item.id)
    else
      render :edit
    end
  end

# 商品削除機能
  def destroy
    @goods_item.destroy
    redirect_to root_path
  end

  def edit
  end

  private

  def goods_item_params
    params.require(:goods_item).permit(:name, :price, :explanation, :category_id, :brand, 
    :condition_id, :shipping_fee_id, :province_id, :delivery_date_id, :delivery_way_id, 
    :selling_price, :status, :seller_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end
 
  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

end
