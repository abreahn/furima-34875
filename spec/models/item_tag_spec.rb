require 'rails_helper'

RSpec.describe ItemTag, type: :model do
  before do
    item = FactoryBot.create(:item)
    @item_tag = FactoryBot.build(:item_tag, item_id: item.id, image: item.image)
    sleep(0.1)
  end

  describe 'Formオブジェクトの生成' do
    context 'Formオブジェクトが生成できるとき' do
      it '必須項目が存在していれば生成できること' do
        expect(@item_tag).to be_valid
      end
    end

    context '中間テーブルが生成できないとき' do
      it '画像が無いと保存できないこと' do
        @item_tag.image = nil
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が無いと保存できないこと' do
        @item_tag.name = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が無いと保存できないこと' do
        @item_tag.description = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が無いと保存できないこと' do
        @item_tag.category_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーのidが1の場合は保存できないこと' do
        @item_tag.category_id = 1
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Category can't be blank")
      end

      it '商品状態についての情報が無いと保存できないこと' do
        @item_tag.condition_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品状態のidが1の場合は保存できないこと' do
        @item_tag.condition_id = 1
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報が無いと保存できないこと' do
        @item_tag.delivery_charge_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '配送料の負担のidが1の場合は保存できないこと' do
        @item_tag.delivery_charge_id = 1
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it '発送元の地域についての情報が無いと保存できないこと' do
        @item_tag.delivery_area_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送元の地域のidが1の場合は保存できないこと' do
        @item_tag.delivery_area_id = 1
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送までの日数についての情報が無いと保存できないこと' do
        @item_tag.delivery_day_id = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '発送までの日数のidが1の場合は保存できないこと' do
        @item_tag.delivery_day_id = 1
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Delivery day can't be blank")
      end

      it '販売価格についての情報が無いと保存できないこと' do
        @item_tag.price = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が¥300以下の場合は保存できないこと' do
        @item_tag.price = 299
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が¥9,999,999より高い場合は保存できないこと' do
        @item_tag.price = 10_000_000
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が半角数字以外の場合は保存できないこと' do
        @item_tag.price = '５００'
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が半角英数字混合の場合は保存できないこと' do
        @item_tag.price = 'a500'
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it '販売価格が半角英数のみの場合は保存できないこと' do
        @item_tag.price = 'aaa'
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include('Price は300〜9999999の範囲の半角数字で設定してください')
      end

      it 'タグ名が無いと保存できないこと' do
        @item_tag.tag_name = ''
        @item_tag.valid?
        expect(@item_tag.errors.full_messages).to include("Tag name can't be blank")
      end
    end
  end
end
