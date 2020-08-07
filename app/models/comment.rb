class Comment < ApplicationRecord
  belongs_to :goods_item, foreign_key: "goods_item_id"
  belongs_to :user, foreign_key:  "user_id"
end
