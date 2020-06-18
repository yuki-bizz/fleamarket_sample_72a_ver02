class Area < ApplicationRecord
  has_many :goods_items
  has_many :user_addresses
end
