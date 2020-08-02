class Comment < ApplicationRecord
  belongs_to :goods_item, foreign_key: "user_id", dependent: :destroy
  belongs_to :user, foreign_key: "goods_item_id", dependent: :destroy
end
