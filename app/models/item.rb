class Item < ApplicationRecord
 extend ActiveHash::Association::ActiveRecordExtensions

 belongs_to :user
 has_one_attached :image

 belongs_to :category_id
 belongs_to :item_status_id
 belongs_to :shipping_cost_id
 belongs_to :prefecture_id
 belongs_to :shipping_date_id

 with_options presence: ture do
  validates :user_id
  validates :name
  validates :description
  validates :category_id
  validates :item_status_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :shipping_date_id
  validates :price, numericality: { greater_than_or_equal_to: 300 }
 end
  

 with_options numericality: { other_than: 0 } do
  validates :category_id
  validates :item_status_id
  validates :shipping_cost_id
  validates :prefecture_id
  validates :shipping_date_id 
 end
end
