class DisplaysController < ApplicationController
  def index
    #N＋１問題解消
    @goods_items = GoodsItem.all.includes(user: :images)
    #カテゴリー
    @ladies = GoodsItem.where(category_id: '1')
    @mens = GoodsItem.where(category_id: '2')
    @toy_hobby_goods = GoodsItem.where(category_id: '6')
    @appliance_smartphone_cameras = GoodsItem.where(category_id: '8')
    #ブランド
    @apples = GoodsItem.where(brand: 'apple')
    @louis_vuittons = GoodsItem.where(brand: 'Louis Vuitton')
  end
end