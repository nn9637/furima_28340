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

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birthday         | date   | null: false |

### Association
- has_many :transactions
- has_many :items


## transactions テーブル
| Column   | Type       | Options                        |
| -------- | ------     | -----------                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one :sending_destination


## sending_destinations テーブル

| Column          | Type       | Options      |
| --------        | ------     | -----------  |
| post_code       | string(7)  | null: false  |
| prefecture_code | integer    | null: false  |
| city            | string     | null: false  |
| house_number    | string     | null: false  |
| building_name   | string     |              |
| phone_number    | string     | unique: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :transactions
- Gem :jp_prefecture


## items テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| name            | string  | null: false |
| introduction    | text    | null: false |
| price           | integer | null: false |
| prefecture_code | integer | null: false |
| condition       | integer | null: false |
| postage_payer   | integer | null: false |
| preparation_day | integer | null: false |
| category        | integer | null: false |
| user            | references | null: false, foreign_key: true |

### Association
- has_one :transaction
- has_one :item_img
- belongs_to :user
- Gem :jp_prefecture


## item_imgs テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| url      | string | null: false |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :item