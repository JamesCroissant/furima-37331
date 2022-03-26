# テーブル設計

## usersテーブル


| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | nulls: false               |
| email              | string | nulls: false, unique: false|
| encrypted_password | string | nulls: false               |
| name               | text   | nulls: false               |
| birthday           | text   | nulls: false               |


### Association

- has_many :items, through: :orders
- belongs_to :orders



## itemsテーブル


| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| title              | string     | nulls: false                    |
| price              | integer    | nulls: false                    |
| seller             | text       | nulls: false                    |
| category           | text       | nulls: false                    |
| condition          | string     | nulls: false                    |
| delivery charge    | string     | nulls: false                    |
| shipping area      | string     | nulls: false                    |
| days               | string     | nulls: false                    |
| user               | references | nulls: false, foreign_key: true |


### Association

- belongs_to :users, through: :orders
- belongs_to :orders



## ordersテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| card information   | integer    | nulls: false                    |
| expiration date    | integer    | nulls: false                    |
| security code      | integer    | nulls: false                    |
| post code          | string     | nulls: false                    |
| prefecture         | string     | nulls: false                    |
| local government   | string     | nulls: false                    |
| address            | string     | nulls: false                    |
| building           | string     | nulls: false                    |
| phone number       | integer    | nulls: false                    |
| user               | references | nulls: false, foreign_key: true |
| item               | references | nulls: false, foreign_key: true |


### Association

- belongs_to :users
- has_many :items