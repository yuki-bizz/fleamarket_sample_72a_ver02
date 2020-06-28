class GoodsItemsController < ApplicationController

  def show
    @goods_item = GoodsItem.find(params[:id])
  end

  def destroy
    goods_item = GoodsItem.find(params[:id])
    goods_item.destroy
  end

  def edit
    @goods_item = GoodsItem.find(params[:id])
  end

end