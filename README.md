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
|self_image|integer||

### Association
- has_many :goods
- has_many :comments dependent: :destroy
- has_many :evaluations dependent: :destroy
- has_many :orders dependent: :destroy
- has_one :user_details dependent: :destroy


## user_detailsテーブル

|Column|Type|Options|
|------|----|-------|
|user_address_id|references||
|credit_cards_id|references||
|tellphone_number|integer||
|self_explanation|string||
|sales_amount|integer|null: false|
|evaluation_icon|integer|null: false|

### Association
- belongs_to :user
- has_one :credit-cards dependent: :destroy
- has_one :user_addresses dependent: :destroy


## goodsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|explanation|string|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references||
|condition|integer|null: false|
|shipping_fee|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|delivery_date|integer|null: false|
|selling_price|integer|null: false|
|size|integer|null: false|
|delivery_way|integer|null: false|
|status|integer|null: false|

### Association
- belongs_to :user
- has_many :comments dependent: :destroy
- belongs_to :area
- belongs_to :brand 
- belongs_to :category
- has_many :images dependent: :destroy
- has_many :evaluations dependent: :destroy
- has_one :order : dependent: :destroy


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|good_id|references|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :good


## areasテーブル

|Column|Type|Options|
|------|----|-------|
|province|integer|null: false|

### Association
- has_many :goods
- has_many :user_addresses


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|good_id|references|null: false, foreign_key: true|
|content|string|null: false|

### Association
- belongs_to :user
- belongs_to :good


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|good_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|payment_way|integer|null: false|
|payment_status|integer|null: false|
|shipping_status|integer|null: false|
|delivery_status|integer|null: false|

### Association
- belongs_to :user
- belongs_to :good


## evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|good_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|user_icon|integer||
|user_evaluation|string||

### Association
- belongs_to :user
- belongs_to :good


## user_addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postcode|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address1|string|null: false|
|address2|string||

### Association
- belongs_to :area
- belongs_to :user_details


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|

### Association
- belongs_to :user_details


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :goods
- has_many :category_brands
- has_many :brands, through: category_brands


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :goods
- has_many :category_brands
- has_many :categories, through: category_brands


## category_brandsテーブル

|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :brand




