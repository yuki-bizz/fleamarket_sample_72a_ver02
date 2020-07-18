require 'rails_helper'
describe GoodsItem do
  describe '#create, #edit' do

    it "nameがない場合は登録できないこと" do
      goods_item = build(:goods_item, name: nil)
      goods_item.valid?
      expect(goods_item.errors[:name]).to include("を入力してください")
    end

    it "user_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, user_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:user]).to include("を入力してください")
    end

    it "explanationがない場合は登録できないこと" do
      goods_item = build(:goods_item, explanation: nil)
      goods_item.valid?
      expect(goods_item.errors[:explanation]).to include("を入力してください")
    end

    it "categoryがない場合は登録できないこと" do
      goods_item = build(:goods_item, category: nil)
      goods_item.valid?
      expect(goods_item.errors[:category]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      goods_item = build(:goods_item, condition: nil)
      goods_item.valid?
      expect(goods_item.errors[:condition]).to include("を入力してください")
    end

    it "shipping_feeがない場合は登録できないこと" do
      goods_item = build(:goods_item, shipping_fee: nil)
      goods_item.valid?
      expect(goods_item.errors[:shipping_fee]).to include("を入力してください")
    end

    it "provinceがない場合は登録できないこと" do
      goods_item = build(:goods_item, province: nil)
      goods_item.valid?
      expect(goods_item.errors[:province]).to include("を入力してください")
    end

    it "delivery_way_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, delivery_way_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:delivery_way_id]).to include("を入力してください")
    end

    it "delivery_dateがない場合は登録できないこと" do
      goods_item = build(:goods_item, delivery_date: nil)
      goods_item.valid?
      expect(goods_item.errors[:delivery_date]).to include("を入力してください")
    end

    it "selling_priceがない場合は登録できないこと" do
      goods_item = build(:goods_item, selling_price: nil)
      goods_item.valid?
      expect(goods_item.errors[:selling_price]).to include("を入力してください")
    end

    
      

  end
end

# require 'rails_helper'
# describe GoodsItem do
#   describe '#save' do
#     it "nameがない場合は登録できないこと" do
#      user = GoodsItem.new(name: "", price:"aaa", explanation:"aaa", category:"aaa", condition:"aaa", shipping_fee:"ssss" province:"ttt", delivery_date:"rrr", delivery_way_id:"ddd", selling_price:"222" )
#      user.valid?
#      expect(goods_item.errors[:name]).to include("can't be blank")
#     end
#   end
# end
