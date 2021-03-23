require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '必須項目が存在していれば保存できること' do
      expect(@item).to be_valid
    end

    it '画像が無いと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が無いと保存できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が無いと保存できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が無いと保存できないこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it '商品状態についての情報が無いと保存できないこと' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end

    it '配送料の負担についての情報が無いと保存できないこと' do
      @item.delivery_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery charge is not a number')
    end

    it '発送元の地域についての情報が無いと保存できないこと' do
      @item.delivery_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area is not a number')
    end

    it '発送までの日数についての情報が無いと保存できないこと' do
      @item.delivery_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day is not a number')
    end

    it '販売価格についての情報が無いと保存できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が¥300以下の場合は保存できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
    end

    it '販売価格が¥9,999,999より高い場合は保存できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
    end

    it '販売価格が半角数字以外の場合は保存できないこと' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
    end
  end
end
