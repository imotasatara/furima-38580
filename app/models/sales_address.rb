class SalesAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :prefecture_id, :town_name, :house_number, :building_name, :phone_number, :sale

  with_options presence: true do
    validates :item, :user, :sale
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows(e.g. 123-4567)"}
    validates :phone_number, numericality: {only_integer: true, length: {in: 10..11}, message: "is invalid. Input only number"}
    validates :town_name, :house_number
  end
  validates :prefecture_id, numericality: {other_than: 1}

  def save
    sale = Sale.create(item: item_id, user: user_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, town_name: town_name, house_number: house_number, building_name: building_name, phone_number: phone_number, sale: sale.id)
  end
end