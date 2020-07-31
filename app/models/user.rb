class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:validatable,
         :omniauthable, omniauth_providers: %i[facebook twitter google_oauth2]

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

# jsを禁止しているクライアントがいる可能性を含めサーバーサイドでもバリデーションをかける
  validates :nickname, :email, :password, :password_confirmation,:family_name,:first_name,:family_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day,:postcode,:province,:city,:address1,:address2,:delivery_family_name,:delivery_first_name,:delivery_family_name_kana,:delivery_first_name_kana,presence: true

# 一意のメールアドレスのみ登録可能
  validates :email, uniqueness: true

# バスワードとパスワード確認が一致していること
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

# パスワードは7文字以上
#  validates :password, length: { minimum: 7 }

# バリデーション詳細

  validates :family_name,
  format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"全角でご入力ください。"}

  validates :first_name,
  format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"全角でご入力ください。"}

  validates :tellphone_number,
  format: {with: /\A[0-9]+\z/, message:"半角数字でご入力ください。"}




  has_many :goods_items
  has_many :sns_credentials
  #has_many :orders, dependent: :destroy
  # has_one :card, dependent: :destroy

end
