require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '必須項目が存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
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
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーのidが1の場合は保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態についての情報が無いと保存できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品状態のidが1の場合は保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報が無いと保存できないこと' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '配送料の負担のidが1の場合は保存できないこと' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '発送元の地域についての情報が無いと保存できないこと' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送元の地域のidが1の場合は保存できないこと' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送までの日数についての情報が無いと保存できないこと' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '発送までの日数のidが1の場合は保存できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '販売価格についての情報が無いと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が¥300以下の場合は保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が¥9,999,999より高い場合は保存できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が半角数字以外の場合は保存できないこと' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が半角英数字混合の場合は保存できないこと' do
        @item.price = 'a500'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が半角英数のみの場合は保存できないこと' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end
    end
  end
end
