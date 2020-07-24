class Card < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :customer_id, presence: true
  validates :card_id, presence: true

end
