class DisplaysController < ApplicationController
  def index
    @goods_items = GoodsItem.all.includes(user: :images)
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
end