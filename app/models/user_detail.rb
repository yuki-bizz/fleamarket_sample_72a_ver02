class UserDetail < ApplicationRecord
  belongs_to :user
  has_one :credit_card, dependent: :destroy
  has_one :user_address, dependent: :destroy
end
