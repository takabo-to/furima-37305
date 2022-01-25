FactoryBot.define do
  factory :order_form do
    item_id {'1'}
    user_id {'1'}
    postcode { '123-4566'}
    prefecture_id { 1 }
    city{'東京都'}
    block {'1-1'}
    building {'東京ハイツ'}
    phone_number {'09012345678'}
  end
end
