class Sale < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :shipment

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
