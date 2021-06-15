require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_address = FactoryBot.build(:item_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '項目に問題がない' do
      it '全ての項目が正しく入力されていれば購入できること' do
        expect(@item_address).to be_valid
      end

      it 'buildingは存在しなくても購入できること' do
        @item_address.building = ''
        expect(@item_address).to be_valid
      end
    end

    context '項目に問題がある' do
      it 'tokenが存在しない時' do
        @item_address.token = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが存在しない時' do
        @item_address.postal_code = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'cityが存在しない時' do
        @item_address.city = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("City can't be blank")
      end

      it 'prefecture_idが存在しない時' do
        @item_address.prefecture_id = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1の時' do
        @item_address.prefecture_id = 1
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'addressが存在しない時' do
        @item_address.address = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'addressがハイフンがなく(123-4567)の形ではない時' do
        @item_address.postal_code = '1234567'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Postal code  is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'numberが存在しない時' do
        @item_address.number = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Number can't be blank")
      end

      it 'numberが11桁以内の数値ではない時' do
        @item_address.number = '090123456789'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Number is too short and is invalid. Input only number')
      end

      it 'numberが数値ではない時' do
        @item_address.number = 'abc'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Number is too short and is invalid. Input only number')
      end

      it 'numberが英数字混合の時' do
        @item_address.number = 'abc12341234'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Number is too short and is invalid. Input only number')
      end

      it 'numberが9桁以内の時' do
        @item_address.number = '090123456'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Number is too short and is invalid. Input only number')
      end

      it 'userが紐付いていないとき' do
        @item_address.user_id = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないとき' do
        @item_address.item_id = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
