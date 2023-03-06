require 'rails_helper'

RSpec.describe SalesAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @sales_address = FactoryBot.build(:sales_address, user_id: user.id, item_id: @item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@sales_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @sales_address.building_name = ''
        expect(@sales_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @sales_address.postal_code = ''
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がハイフンを含んだ正しい形式でないと保存できない' do
        @sales_address.postal_code = '1234567'
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows(e.g. 123-4567)')
      end
      it '都道府県が"---"では保存できない' do
        @sales_address.prefecture_id = '1'
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空では保存できない' do
        @sales_address.prefecture_id = ''
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @sales_address.town_name = ''
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("Town name can't be blank")
      end
      it '番地が空だと保存できない' do
        @sales_address.house_number = ''
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @sales_address.phone_number = ''
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が文字だと保存できない' do
        @sales_address.phone_number = 'aaabbbbcccc'
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号が全角だと保存できない' do
        @sales_address.phone_number = '０９０１１１１１１１１'
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号が10桁未満だと保存できない' do
        @sales_address.phone_number = '123456789'
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include('Phone number should be 10 or 11 digits in length only')
      end
      it '電話番号が11桁より多いと保存できない' do
        @sales_address.phone_number = '123456789012'
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include('Phone number should be 10 or 11 digits in length only')
      end
      it 'userが紐付いていないと保存できない' do
        @sales_address.user_id = nil
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @sales_address.item_id = nil
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @sales_address.token = nil
        @sales_address.valid?
        expect(@sales_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
