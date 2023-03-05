FactoryBot.define do
  factory :sales_address do
    item_id { '1' }
    user_id { '1' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    town_name { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011111111' }
    sale_id { '1' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
