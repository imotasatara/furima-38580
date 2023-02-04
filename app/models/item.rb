class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :image, :item_name, :description, :price, presence: true
end