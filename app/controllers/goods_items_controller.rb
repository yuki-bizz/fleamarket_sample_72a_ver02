class GoodsItemsController < ApplicationController
before_action :set_goods_item
# before_action :move_to_root_path, except: [:index]

  def index
    @goods_items = GoodsItem.includes(:images).order('created_at DESC')
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @goods_item = GoodsItem.new
    @goods_item.images.new
  end

  def create
    @goods_item = GoodsItem.new(goods_item_params)
    # binding.pry
    if @goods_item.save
      redirect_to goods_items_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    goods_item.destroy
  end

  def edit
  end

  private

  def goods_item_params
    params.require(:goods_item).permit(:name, :price, :explanation, :category, :brand, :condition, :shipping_fee, :province, :delivery_date, :delivery_way_id, :selling_price, :status, :seller_id, images_attributes: [:src]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end

  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end

   # def  move_to_index
  #   redirect_to action: :root_path unless user_signed_in?
  # end

end

