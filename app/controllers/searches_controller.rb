class SearchesController < ApplicationController
  def index
    # @goods_items = GoodsItem.search(params[:search]).limit(132)
    # @goods_items = GoodsItem.all
    @goods_items = GoodsItem.search(params[:search])
    @search = params[:search]
  end
end
