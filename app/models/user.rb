class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :goods_items
  #has_many :orders, dependent: :destroy
  # has_one :card, dependent: :destroy

  # favorites-function
  has_many :favorites, dependent: :destroy
  has_many :favorites, through: :favorites, source: :goods_items
  has_many :comments, dependent: :destroy
end
