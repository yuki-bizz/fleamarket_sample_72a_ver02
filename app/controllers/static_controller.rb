class StaticController < ApplicationController

  def destroy
    goods_item = Goods_item.find(params[:id])
    goods_item.destroy
  end

  def edit
    @goods_item = Goods_item.find(params[:id])
  end
  
end
