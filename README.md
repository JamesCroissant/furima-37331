# テーブル設計

## usersテーブル


| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: false|
| encrypted_password   | string | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| furigana_family_name | string | null: false               |
| furigana_first_name  | string | null: false               |
| birthday             | date   | null: false               |


### Association

- has_many :items
- has_many :orders



## itemsテーブル


| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| seller             | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| day_id             | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :users



## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_information   | integer    | null: false                    |
| expiration_date    | integer    | null: false                    |
| security_code      | integer    | null: false                    |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| local_government   | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :users