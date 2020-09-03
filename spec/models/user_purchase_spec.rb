require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '#create' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'tokenが空だと保存できないこと' do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_purchase.postal_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("PostalCode can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_purchase.postal_code = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefecture_codeが空だと保存できないこと' do
      @user_purchase.prefecture_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("PrefectureCode can't be blank")
    end

    it 'prefecture_codeがid = 1の場合では登録できないこと' do
      @user_purchase.prefecture_code = 'id = 1'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("PrefectureCode can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと保存できないこと' do
      @user_purchase.house_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("HouseNumber can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @user_purchase.building_name = nil
      expect(@user_purchase).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @user_purchase.phone_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("PhoneNumber can't be blank")
    end

    it 'phone_numberが11桁以下であれば登録できること' do
      @user_purchase.phone_number = '00000000000'
      @user_purchase.phone_number_confirmation = '0000000000'
      expect(@user_purchase).to be_valid
    end

  end
end
