class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goods_items
  has_many :comments, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :user_detail, dependent: :destroy
end

