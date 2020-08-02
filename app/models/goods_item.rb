class GoodsItem < ApplicationRecord
  validates  :name,:province_id, :explanation, :condition_id, :category_id, :shipping_fee_id, :delivery_way_id, :delivery_date_id, :selling_price, presence: true
  belongs_to :user
  belongs_to :category, optional: true
  has_many :images, dependent: :destroy
  ## 購入機能実装時使用 ###
  has_one :order, dependent: :destroy




  
  # favorites-function
  has_many :favorites, dependent: :destroy
  has_many :favorites, through: :favorites, source: :user
  
  
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
  
  
  # あいまい検索
  def self.search(search)
    return GoodsItem.all unless search
    GoodsItem.where(['name LIKE (?)', "%#{search}%"])
  end

end
