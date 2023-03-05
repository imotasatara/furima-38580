class SalesAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :town_name, :house_number, :building_name, :phone_number,
                :sale_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows(e.g. 123-4567)' }
    validates :phone_number, length: { in: 10..11, message: 'should be 10 or 11 digits in length only' },
                             numericality: { only_integer: true, message: 'is invalid. Input only number' }
    validates :user_id, :town_name, :house_number
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    sale = Sale.create(item_id: item_id, user_id: user_id)
    Shipment.create(postal_code: postal_code, prefecture_id: prefecture_id, town_name: town_name, house_number: house_number,
                    building_name: building_name, phone_number: phone_number, sale_id: sale.id)
  end
end
