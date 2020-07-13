class GoodsItemsController < ApplicationController
  before_action :set_goods_item, only: [:show, :edit]

  def check
    @goods_items = GoodsItem.includes(:images).order('created_at DESC')
  end

  def index
    #カテゴリー
    @ladies_category = Category.find_by(name: "レディース")
    @ladies = GoodsItem.where(category_id: @ladies_category.subtree)
    @mens_category = Category.find_by(name: "メンズ")
    @mens = GoodsItem.where(category_id: @mens_category.subtree)
    @toy_hobby_goods_category = Category.find_by(name: 'おもちゃ・ホビー・グッズ')
    @toy_hobby_goods = GoodsItem.where(category_id: @toy_hobby_goods_category.subtree)
    @appliance_smartphone_cameras_category = Category.find_by(name: '家電・スマホ・カメラ')
    @appliance_smartphone_cameras = GoodsItem.where(category_id: @appliance_smartphone_cameras_category.subtree)
    #ブランド
    @apples = GoodsItem.where(brand: 'apple')
    @louis_vuittons = GoodsItem.where(brand: 'Louis Vuitton')
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @parent = Category.where(ancestry:nil)
    @goods_item = GoodsItem.new
    @goods_item.images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["選択して下さい"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
   end
  end

  def create
    @goods_item = GoodsItem.new(goods_item_params)
    if @goods_item.save
      # redirect_to goods_items_path
      redirect_to action: :check
    else
      @category_parent_array = ["選択して下さい"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      render :new
    end

  end

  def show
    @parents = Category.where(ancestry:nil)
  end

  def destroy
    goods_item.destroy
  end

  def edit
  end

  def update
    @goods_item = GoodsItem.find_by(id: params[:id])
    @goods_item.update(id: params[:id])
    redirect_to action: :index
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def goods_item_params
    params.require(:goods_item).permit(:name, :price, :explanation, :category_id, :brand, 
    :condition_id, :shipping_fee_id, :province_id, :delivery_date_id, :delivery_way_id, 
    :selling_price, :status, :seller_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end

  def set_goods_item
    @goods_item = GoodsItem.find(params[:id])
  end
end