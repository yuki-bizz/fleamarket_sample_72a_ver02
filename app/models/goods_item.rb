class GoodsItem < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_one :order, dependent: :destroy
end
