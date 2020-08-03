class FavoritesController < ApplicationController
  before_action :set_goods_item, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(
      user_id: current_user.id,
      goods_item_id: @goods_item.id
    )
    @favorite.save!
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id,
      goods_item_id: @goods_item.id
    )
    @favorite.destroy
  end

  private
  def  set_goods_item
    @goods_item = GoodsItem.find(params[:goods_item_id])
  end

end
