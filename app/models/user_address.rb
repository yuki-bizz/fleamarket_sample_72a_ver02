class UserAddress < ApplicationRecord
  belongs_to :area
  belongs_to :user_detail
end
