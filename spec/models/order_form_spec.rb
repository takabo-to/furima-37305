require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁ハイフン4桁」の組み合わせであれば保存できる' do
        @order_form.postcode = '123-4560'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外であれば保存できる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.city = '横浜市緑区'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.block = '青山１１１'
        expect(@order_form).to be_valid
      end
      it '建物名は空でも保存できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_form.phone_number = 12_345_678_910
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報が保存できない時' do
      it '郵便番号が空だと保存できない' do
        @order_form.postcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order_form.postcode = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_form.phone_number = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できない' do
        @order_form.phone_number = 12_345_678_910_123_111
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'トークンが空だと保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
