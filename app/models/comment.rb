class Comment < ApplicationRecord
  belongs_to :goods_item
  belongs_to :user
end
