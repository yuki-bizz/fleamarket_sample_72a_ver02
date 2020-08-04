class SearchesController < ApplicationController
  before_action :set_ransack
  
  def index
    @goods_items = GoodsItem.search(params[:search])
    @search = params[:search]
  end

  def detail
    @search = params[:search]
    @search_item = GoodsItem.ransack(params[:q]) 
    @items = @search_item.result.page(params[:page])
  end

private

  def set_ransack
    @q = GoodsItem.ransack(params[:q])
  end
end
