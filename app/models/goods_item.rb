class GoodsItem < ApplicationRecord
  validates  :name,:province_id, :explanation, :condition_id, :shipping_fee_id, :delivery_way_id, :delivery_date_id, :selling_price, presence: true
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  ### 購入機能実装時使用 ###
  # has_one :order, dependent: :destroy
  

  
  # モデルimage.rbにバリデーションをかける
  validates_associated :images
  validates :images, presence: true
  # fields_forメソッドを利用するために、imageモデルを小モデルとする
  accepts_nested_attributes_for :images, allow_destroy: true
  ### 購入機能実装時使用 ###
  # has_one :order, dependent: :destroy

  # active_hashによるリレーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :province
  belongs_to_active_hash :delivery_date



end
