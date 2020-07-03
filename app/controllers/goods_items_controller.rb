class GoodsItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goods_item, except: [:index, :new, :create]

# 一覧画面（確認用）
  def index
    @goods_items = GoodsItem.includes(:images).order('created_at DESC')
  end

# 商品出品画面
  def new
    redirect_to new_user_session_path unless user_sined_in?
    @goods_item = GoodsItem.new
    @goods_item.images.new
  end

# 商品保存機能
  def create
    @goods_item = GoodsItem.new(goods_item_params)
    if @goods_item.save
      redirect_to goods_items_path
    else
      render :new
  end

# 商品更新機能
  def update
    if @goods_item.update(goods_item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

# 商品詳細ページ
  def show
  end

# 商品削除機能
  def destroy
    goods_item.destroy
  end

# 商品編集画面
  def edit
  end

  private

  def goods_item_params
    params.require(:goods_item).permit(:name, :price, :explanation, :brand, :condition_id, :shipping_fee [:src, :_destroy, :id])
  end
 
  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless user_sined_in?
  end

end