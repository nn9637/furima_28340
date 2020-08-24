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

    it 'prefecture_codeが空では登録できないこと' do
      @item.prefecture_code = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Code can't be blank")
    end

    it 'conditionが空では登録できないこと' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    
    it 'postage_payerが空では登録できないこと' do
      @item.postage_payer = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage Payer can't be blank")
    end
    
    it 'preparation_dayが空では登録できないこと' do
      @item.preparation_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation Day can't be blank")
    end
    
    it 'categoryが空では登録できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

  end
end
