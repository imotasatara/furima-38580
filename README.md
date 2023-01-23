## Usersテーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name_kanji  | string | null: false |
| first_name_kanji   | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

## Association
- has_many :items
- has_many :sales


## Itemsテーブル

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| shipping_fee   | string     | null: false                    |
| sender_address | string     | null: false                    |
| delivery_days  | string     | null: false                    |
| price          | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :sale


## Salesテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

## Association
- belongs_to :item
- belongs_to :user
- has_one :shipment


## Shipmentsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| town_name     | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

## Association
- belongs_to :sale
