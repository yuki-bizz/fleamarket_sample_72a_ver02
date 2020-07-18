class Image < ApplicationRecord
  
  # validates :src, presence: true
  mount_uploader :src, ImageUploader
  belongs_to :goods_item, optional: true
end
