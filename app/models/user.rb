class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :delivery_family_name, :delivery_first_name, :delivery_family_name_kana, :delivery_first_name_kana, :postcode, :province, :city, :address1, presence: true, uniqueness: true

  #has_many :goods_items
  #has_many :orders, dependent: :destroy
  #has_one :card, dependent: :destroy
end

