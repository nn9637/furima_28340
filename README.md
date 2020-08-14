# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :profiles
- has_one :credit_cards
- has_one :sending_destinations


## profiles テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birth_year       | date   | null: false |
| birth_year       | date   | null: false |
| birth_year       | date   | null: false |

### Association

- belongs_to :user


## credit_cards テーブル

| Column           | Type    | Options                   |
| --------         | ------  | -----------               |
| card_number      | integer | null: false, unique: true |
| expiration_year  | integer | null: false               |
| expiration_month | integer | null: false               |
| security_code    | integer | null: false               |

### Association

- belongs_to :user


## sending_destinations テーブル

| Column          | Type       | Options      |
| --------        | ------     | -----------  |
| post_code       | integer(7) | null: false  |
| prefecture_code | integer    | null: false  |
| city            | string     | null: false  |
| house_number    | string     | null: false  |
| building_name   | string     | null: false  |
| phone_number    | integer    | unique: true |


### Association

- belongs_to :user
- Gem :jp_prefecture


## items テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| name            | string  | null: false |
| introduction    | text    | null: false |
| price           | string  | null: false |
| prefecture_code | integer | null: false |

### Association

- has_one :item_img
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :category
- belongs_to :seller, class_name:"User"
- belongs_to :buyer, class_name:"User"
- Gem :jp_prefecture


## item_imgs テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| url      | string | null: false |

### Association

- belongs_to :item


## item_condition テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| item_condition | string | null: false |

### Association

- has_one :items


## postage_payer テーブル

| Column        | Type   | Options     |
| --------      | ------ | ----------- |
| postage_payer | string | null: false |

### Association

- has_one :items


## preparation_day テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| preparation_day | string | null: false |

### Association

- has_one :items


## categories テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| category  | string | null: false |

### Association

- has_one :items