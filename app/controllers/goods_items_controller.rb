class GoodsItemsController < ApplicationController

before_action :set_goods_item

  def show
  end

  def destroy
    goods_item = GoodsItem.find(params[:id])
    goods_item.destroy
  end

  def edit
  end

  private

  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

end