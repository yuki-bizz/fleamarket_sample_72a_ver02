class GoodsItem < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  # has_many :comments, dependent: :destroy
  belongs_to :area
  belongs_to :brand 
  belongs_to :cateory
=======
>>>>>>> master
  has_many :images, dependent: :destroy
  has_one :order, dependent: :destroy
end
