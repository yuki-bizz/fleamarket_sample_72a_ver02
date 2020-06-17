class Category < ApplicationRecord
  has_many :goods_items
  has_many :category_brands
  has_many :brands, through: :category_brands
end
