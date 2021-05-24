require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品ができる時' do
    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end
  end

  context '出品ができない時' do
    # it '商品画像が存在しないとき' do
    #   @item. = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include()
    # end

    it '商品名が存在しないとき' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が存在しないとき' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリー が存在しないとき' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態が存在しないとき' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担が存在しないとき' do
      @item.fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
    end

    it '発送元の地域が存在しないとき' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数が存在しないとき' do
      @item.days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it '販売価格が存在しないとき' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が、¥300~¥9,999,999の間ではない時(未満)' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '販売価格が、¥300~¥9,999,999の間ではない時(より上)' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '販売価格が、半角数字ではない時' do
      @item.price = 'あ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '販売価格が、半角数字ではない時' do
      @item.price = 'a'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it '販売価格が、半角数字ではない時' do
      @item.price = '１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
