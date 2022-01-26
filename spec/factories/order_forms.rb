FactoryBot.define do
  factory :order_form do
    postcode { '123-4566' }
    prefecture_id { 1 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
