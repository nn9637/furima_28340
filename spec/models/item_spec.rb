require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'introductionが空では登録できないこと' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it 'categoryが空では登録できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Code can't be blank")
    end

    it 'categoryがid = 1の場合では登録できないこと' do
      @item.category = 'id = 1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Code can't be blank")
    end

    it 'conditionが空では登録できないこと' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'conditionがid = 1の場合では登録できないこと' do
      @item.condition = 'id = 1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'postage_payerが空では登録できないこと' do
      @item.postage_payer = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage_payer can't be blank")
    end

    it 'postage_payerがid = 1の場合では登録できないこと' do
      @item.postage_payer = 'id = 1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage_payer can't be blank")
    end

    it 'prefecture_codeが空では登録できないこと' do
      @item.prefecture_code = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture_code can't be blank")
    end

    it 'prefecture_codeがid = 1の場合では登録できないこと' do
      @item.prefecture_code = 'id = 1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture_code can't be blank")
    end

    it 'preparation_dayが空では登録できないこと' do
      @item.preparation_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation_day can't be blank")
    end

    it 'preparation_dayがid = 1の場合では登録できないこと' do
      @item.preparation_day = 'id = 1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation_day can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300..9_999_999範囲であれば登録できること' do
      @item.price = '300..9_999_999'
      @item.valid?
      expect(@item).to be_valid
    end

    it 'priceが299以下であれば登録できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is too low (minimum is 300)')
    end

    it 'priceが1000000以上であれば登録できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is too high (maximum is 9999999 characters)')
    end
  end
end