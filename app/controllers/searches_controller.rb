class SearchesController < ApplicationController
  def index
    @goods_items = GoodsItem.search(params[:search])
    @search = params[:search]
  end
end
