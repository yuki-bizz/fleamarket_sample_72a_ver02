class GoodsItem < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :area
  belongs_to :brand 
  belongs_to :cateory
  has_many :images, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_one :order, dependent: :destroy
end
