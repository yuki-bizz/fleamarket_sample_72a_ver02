class DisplaysController < ApplicationController
  def index
    @goods_items = GoodsItem.all
    pp @goods_items
    #カテゴリー
    @womens = GoodsItem.where(category: 'レディース')
    @mens = GoodsItem.where(category: 'メンズ')
    @toys = GoodsItem.where(category: 'おもちゃ・ホビー・グッズ')
    @appliances = GoodsItem.where(category: '家電・スマホ・カメラ')
    #ブランド
    @apples = GoodsItem.where(brand: 'apple')
    @louis_vuittons = GoodsItem.where(brand: 'Louis Vuitton')
  end
end