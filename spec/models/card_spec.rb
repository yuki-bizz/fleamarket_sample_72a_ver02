require 'rails_helper'

# before do
#   @user = FactoryBot.build(:user)
# end

describe Card do
  describe '#new' do

    it "userがない場合は登録できないこと" do
      card = Card.new(user_id: nil, customer_id: "cus_6723077e37b1f41e121e4c45fef9", card_id: "car_9c74974db75af6e145834b42445f")
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end

    it "customer_idがない場合は登録できないこと" do
      card = Card.new(user_id: "1", customer_id: nil, card_id: "car_9c74974db75af6e145834b42445f")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idがない場合は登録できないこと" do
      card = Card.new(user_id: "1", customer_id: "cus_6723077e37b1f41e121e4c45fef9", card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end

  end
end