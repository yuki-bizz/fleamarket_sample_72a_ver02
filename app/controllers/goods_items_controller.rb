class GoodsItemsController < ApplicationController
  before_action :set_goods_item, only: [:show, :edit, :update, :destroy]

  def check
    @goods_items = GoodsItem.includes(:images).order('created_at DESC')
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

# 商品保存機能
  def create
    @goods_item = GoodsItem.new(goods_item_params)
    if @goods_item.save
      redirect_to action: :check
    else
      @category_parent_array = ["選択して下さい"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      render :new
    end
  end

# 商品詳細ページ
  def show
    @parents = Category.where(ancestry:nil)
  end

# 商品編集画面
  def edit
    @category_parent_array = ["選択して下さい"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
  
# 商品更新機能
  def update
    if @goods_item.update(goods_item_params)
      redirect_to goods_item_path(@goods_item.id)
    else
      render :edit
    end
  end
  
# 商品削除機能
  def destroy
    if  current_user.id == @goods_item.seller_id
      @goods_item.destroy
      redirect_to root_path
    else
      render :edit
    end
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
