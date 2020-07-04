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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unigue:true|
|password|string|null: false|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|delivery_family_name|string|null: false|
|delivery_first_name|string|null: false|
|delivery_family_name_kana|string|null: false|
|delivery_first_name_kana|string|null: false|
|postcode|integer|null: false|
|province|string|null: false|
|city|string|null: false|
|address1|string|null: false|
|address2|string||
|tellphone_number|integer||

### Association
- has_many :goods_items
- has_many :comments dependent: :destroy
- has_many :evaluations dependent: :destroy
- has_many :orders dependent: :destroy
- has_one :credit_card dependent: :destroy


## goods_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|explanation|text|null: false|
|category|string|null: false|
|brand|string||
|condition|string|null: false|
|shipping_fee|string|null: false|
|province|string|null: false|
|delivery_way|string|null: false|
|delivery_date|string|null: false|
|selling_price|integer|null: false|
|status|string||
|seller_id|integer||
|buyer_id|integer||

### Association
- belongs_to :user
- has_many :comments dependent: :destroy
- has_many :images dependent: :destroy
- has_one :evaluation dependent: :destroy
- has_one :order dependent: :destroy


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|goods_item_id|references|null: false, foreign_key: true|
|src|string|null: false|

### Association
- belongs_to :goods_item


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|goods_item_id|references|null: false, foreign_key: true|
|content|string|null: false|

### Association
- belongs_to :user
- belongs_to :goods_item


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|goods_item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|payment_way|integer|null: false|
|payment_status|integer|null: false|
|shipping_status|integer|null: false|
|delivery_status|integer|null: false|

### Association
- belongs_to :user
- belongs_to :goods_item

## evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|goods_item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|user_icon|integer||
|user_evaluation|string||

### Association
- belongs_to :user
- belongs_to :goods_item


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :goods_items dependent: :destroy