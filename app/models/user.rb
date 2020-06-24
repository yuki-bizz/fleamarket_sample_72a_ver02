class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #:validatable


  #validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :delivery_family_name, :delivery_first_name, :delivery_family_name_kana, :delivery_first_name_kana, :postcode, :province, :city, :address1, presence: true, uniqueness: true


  #validates :family_name,
  #format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
  #          message: "は全角のみが使えます"}


#  validates :first_name,
#  format: {with: /\A[a-zA-Z0-9]+\z/,
#            message: "は全角のみが使えます"}

#  validates :family_name_kana, 
#  format: {with: /\A[a-zA-Z0-9]+\z/,
#            message: "は全角のみが使えます"}


# あとでunlessに直す
#  validates :tellphone_number,
#  format: {with: /\A[ぁ-んァ-ヶー－]+\z/,
#            message: "は半角数字のみが使えます"}



  #has_many :goods_items
  #has_many :orders, dependent: :destroy
  #has_one :card, dependent: :destroy
end

