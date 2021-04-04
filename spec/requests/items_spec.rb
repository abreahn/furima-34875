require 'rails_helper'

RSpec.describe "Items", type: :request do
  before do
    @item = FactoryBot.create(:item)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに商品名が存在する' do 
      get root_path
      expect(response.body).to include(@item.name)
    end
    it 'indexアクションにリクエストするとレスポンスに商品の画像URLが存在する' do
      get root_path
      expect(response.body).to include('test_image.png') 
    end
    it 'indexアクションにリクエストするとレスポンスに商品の値段が存在する' do 
      get root_path
      expect(response.body).to include("#{@item.price}")
    end

    it 'indexアクションにリクエストするとレスポンスに配送料が存在する' do 
      get root_path
      expect(response.body).to include(@item.delivery_charge.name)
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get item_path(@item)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに商品名が存在する' do
      get item_path(@item)
      expect(response.body).to include(@item.name) 
    end
    it 'showアクションにリクエストするとレスポンスに商品の画像URLが存在する' do 
      get item_path(@item)
      expect(response.body).to include('test_image.png')
    end
    it 'showアクションにリクエストするとレスポンスに商品の値段が存在する' do 
      get item_path(@item)
      expect(response.body).to include("#{@item.price}")
    end
    it 'showアクションにリクエストするとレスポンスに商品の配送料が存在する' do 
      get item_path(@item)
      expect(response.body).to include(@item.delivery_charge.name)
    end
    it 'showアクションにリクエストするとレスポンスに商品のコメントが存在する' do 
      get item_path(@item)
      expect(response.body).to include(@item.description)
    end
    it 'showアクションにリクエストするとレスポンスに出品者のニックネームが存在する' do 
      get item_path(@item)
      expect(response.body).to include(@item.user.nickname)
    end
    
  end 
end
