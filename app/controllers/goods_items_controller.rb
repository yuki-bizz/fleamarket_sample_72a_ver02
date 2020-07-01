class GoodsItemsController < ApplicationController

before_action :set_goods_item, except: [:index, :new, :create]

# 一覧画面（確認用）
  def index
    @goods_item = GoodsItem.includes(:images).order('created_at DESC')
  end

# 商品出品画面
  def new
  end

# 商品保存機能
  def create
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
    params.require(:goods_item).permit(:name, :price, images_attributes:  [:src, :_destroy, :id])
  end
 
  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

end