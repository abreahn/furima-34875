require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end
    context '商品購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_shipping).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空の場合購入できないこと' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがない場合購入できないこと' do
        @purchase_shipping.postal_code = '1111111'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が選択されていない場合購入できないこと' do
        @purchase_shipping.delivery_area_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Delivery area select")
      end

      it '都道府県のidが1の場合購入できないこと' do
        @purchase_shipping.delivery_area_id = '1'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Delivery area select")
      end

      it '市区町村が空の場合購入できないこと' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空の場合購入できないこと' do
        @purchase_shipping.addresses = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空の場合購入できないこと' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上の場合購入できないこと' do
        @purchase_shipping.phone_number = '123456789012'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number input only number within 11 digits")
      end

      it '電話番号が全角数字の場合購入できないこと' do
        @purchase_shipping.phone_number = '１２３４５６７８９０１'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number input only number within 11 digits")
      end
    end
  end
end
