class Item < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_day_id
  end
  with_options presence: true do
    validates :price,
              numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
              inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
  end
  validates :image, :item_name, :description, presence: true

  belongs_to :user
  has_one :sale
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery_day
end
