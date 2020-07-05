require 'rails_helper'
describe Image do
  describe '#create' do

    it "goods_item_idがない場合は登録できないこと" do
      image = build(:image, goods_item_id: nil)
      image.valid?
      expect(image.errors[:goods_item]).to include("を入力してください")
    end
    
    it "srcがない場合は登録できないこと" do
      image = build(:image, src: nil)
      image.valid?
      expect(image.errors[:src]).to include("を入力してください")
    end
    

  end
end