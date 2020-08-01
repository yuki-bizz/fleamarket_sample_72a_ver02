require 'rails_helper'
describe GoodsItem do
  describe '#create, #edit' do

    it "nameがない場合は登録できないこと" do
      binding.pry
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

    it "category_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, category_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:category_id]).to include("を入力してください")
    end

    it "condition_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, condition_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:condition_id]).to include("を入力してください")
    end

    it "shipping_fee_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, shipping_fee_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:shipping_fee_id]).to include("を入力してください")
    end

    it "province_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, province_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:province_id]).to include("を入力してください")
    end

    it "delivery_way_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, delivery_way_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:delivery_way_id]).to include("を入力してください")
    end

    it "delivery_date_idがない場合は登録できないこと" do
      goods_item = build(:goods_item, delivery_date_id: nil)
      goods_item.valid?
      expect(goods_item.errors[:delivery_date_id]).to include("を入力してください")
    end

    it "selling_priceがない場合は登録できないこと" do
      goods_item = build(:goods_item, selling_price: nil)
      goods_item.valid?
      expect(goods_item.errors[:selling_price]).to include("を入力してください")
    end
    
    it "srcがない場合は登録できないこと" do
      goods_item = build(:goods_item, images: [])
      goods_item.valid?
      expect(goods_item.errors.full_messages).to include("画像を入力してください")
    end
      

  end
end

