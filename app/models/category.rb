class Category < ApplicationRecord
  has_many :goods_items, dependent: :destroy
  has_ancestry
end
