require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができる場合' do
     it 'すべての入力項目が存在すれば登録ができる' do
      expect(@item).to be_valid
     end
     it 'カテゴリーが「---」以外であれば登録できる' do
      @item.category_id
      expect(@item).to be_valid
     end
     it '商品の状態が「---」以外であれば登録ができる' do
      @item.item_status_id = 1
        expect(@item).to be_valid
     end
     it '配送料の負担が「---」以外であれば登録ができる' do
      @item.shipping_cost_id = 1
      expect(@item).to be_valid
     end
     it '発送元地域が「---」以外であれば登録ができる' do
      @item.prefecture_id = 1
      expect(@item).to be_valid
     end
     it '発送までの日数が「---」以外であれば登録ができる' do
      @item.shipping_date_id = 1
      expect(@item).to be_valid
     end
     it '価格が半角数字かつ300円〜9,999,999円であれば登録できる' do
      @item.price = 300
      expect(@item).to be_valid
     end

    end
  
    context '出品登録ができない場合' do
      it 'ユーザー登録していないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
      end
      it '画像をつけないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空欄だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの選択が「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it '商品の状態選択が「---」だと出品できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 0')
      end
      it '配送料の負担選択が「---」と出品できない' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 0')
      end
      it '発送元の地域の選択が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 0')
      end
      it '価格が空欄だと出品だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が、300円〜9,999,999円以外だと出品できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end



    end
      
  end

end
