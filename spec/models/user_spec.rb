require 'rails_helper'

describe User do
  describe '#create' do
    # 1
    it "nickname/email/password/password_confirmation/family_name/first_name/family_name_kana/first_name_kana/birth_year/birth_month/birth_day/postcode/province/city/address1/address2/delivery_family_name/delivery_first_name/delivery_family_name_kana/delivery_first_name_kanaが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2
    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

   # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません","を入力してください")
    end

   # 6
    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

   # 7
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

   # 8
    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

   # 9
    it "birth_yearがない場合は登録できないこと" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

   # 10
    it "birth_monthがない場合は登録できないこと" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

   # 11
    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

   # 12
    it "postcodeがない場合は登録できないこと" do
      user = build(:user, postcode: nil)
      user.valid?
      expect(user.errors[:postcode]).to include("を入力してください")
    end

   # 13
    it "provinceがない場合は登録できないこと" do
      user = build(:user, province: nil)
      user.valid?
      expect(user.errors[:province]).to include("を入力してください")
    end

   # 14
    it "cityがない場合は登録できないこと" do
      user = build(:user, city: nil)
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

   # 15
    it "address1がない場合は登録できないこと" do
      user = build(:user, address1: nil)
      user.valid?
      expect(user.errors[:address1]).to include("を入力してください")
    end

   # 16
    it "delivery_family_nameがない場合は登録できないこと" do
      user = build(:user, delivery_family_name: nil)
      user.valid?
      expect(user.errors[:delivery_family_name]).to include("を入力してください")
    end

   # 17
    it "delivery_first_nameがない場合は登録できないこと" do
      user = build(:user, delivery_first_name: nil)
      user.valid?
      expect(user.errors[:delivery_first_name]).to include("を入力してください")
    end

   # 18
    it "delivery_family_name_kanaがない場合は登録できないこと" do
      user = build(:user, delivery_family_name_kana: nil)
      user.valid?
      expect(user.errors[:delivery_family_name_kana]).to include("を入力してください")
    end

   # 19
    it "delivery_first_name_kanaがない場合は登録できないこと" do
      user = build(:user, delivery_first_name_kana: nil)
      user.valid?
      expect(user.errors[:delivery_first_name_kana]).to include("を入力してください")
    end

    # 20
    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 21
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    # 22
    it " passwordが6文字以下の場合登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
  end
end
