## Users_テーブル

| Column             | Type     | Option                    |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| family_name_kanji  | string   | null: false               |
| first_name_kanji   | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | datetime | null: false               |


## Association
- has_many :items
- has_many :sales


## Items_テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :sale


## Sales_テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user
- has_one :shipment


## Shipments_テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| town_name     | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| sale_id       | references | null: false, foreign_key: true |

## Association
- belongs_to :sale
