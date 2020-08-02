require 'rails_helper'

describe SearchesController, type: :controller do

  describe 'GET #index' do
    
    it "テスト1:パを検索した場合、商品名パスが出力される" do
      
      goods_item = build(:goods_item)
      
      search = "パ"
      expect(goods_item.name).to include search
    end

    it "テスト2:パスを検索した場合、商品名パスが出力される" do
      search_item = create(:goods_item, name: "パス")
      goods_item = GoodsItem.search("パス")
      expect(goods_item.first.name).to eq "パス"
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

end