class GoodsItemsController < ApplicationController
  def index
    @goods_items = GoodsItem.includes(:images).order('created_at DESC')
  end

  def new
    @goods_item = GoodsItem.new
    @goods_item.images.new
  end

  def create
    # @goods_item = GoodsItem.cerate(goods_item_params, user_id: current_user.id)
    @goods_item = GoodsItem.new(goods_item_params)
    # binding.pry
    if @goods_item.save
      redirect_to goods_items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def goods_item_params
    params.require(:goods_item).permit(:name, :price, :explanation, :category, :brand, :condition, :shipping_fee, :province, :delivery_date, :delivery_way_id, :selling_price, :status, :seller_id, images_attributes: [:src]).merge(user_id: current_user.id).merge(buyer_id: current_user.id)
   
    
  end

end
