class GoodsItem < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  has_one :order, dependent: :destroy
end
