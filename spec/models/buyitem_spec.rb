require 'rails_helper'

RSpec.describe BuyItem, type: :model do
    describe 'クレカ・住所の保存' do
      before do
        @buy_item = FactoryBot.build(:buy_item)
      end
  
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_item).to be_valid
      end
      it 'postal_codeが空だと保存できないこと' do
        @buy_item.postal_code = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがついてないと保存できないこと' do
        @buy_item.postal_code = '1234567'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeは半角数字でないと保存できないこと' do
        @buy_item.postal_code = '１２３ー４５６７'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと保存できないこと' do
        @buy_item.prefecture_id = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @buy_item.prefecture_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @buy_item.municipality = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'municipality全角ひらがな、全角カタカナ、漢字でないと保存できないこと' do
        @buy_item.municipality = 'yokohamashi'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Municipality is invalid")
      end
      it 'house_numberが空だと保存できないこと' do
        @buy_item.house_number = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("House number can't be blank")
      end
      it 'building_nameは空でも保存できること' do
        @buy_item.building_name = nil
        expect(@buy_item).to be_valid
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_item.phone_number = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは半角数字でないと保存できないこと' do
        @buy_item.phone_number = '０８０１２３４５６７８'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @buy_item.phone_number = '080-1234-5678'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number is invalid. Not Include hyphen(-)")
      end
      it 'phone_numberは11桁以内でないと保存できない' do
        @buy_item.phone_number = '080123456789'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number is invalid. Within 11 digits")
      end
      it 'tokenが空だと保存できない' do
        @buy_item.token = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Token can't be blank")
      end
    end
end
