class Tester < ApplicationRecord
  has_many :reviews
  has_many :review_on_reviws
  has_many :test_product_info
  
  # ActiveHashのアソシエーション設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :sex
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 正規表現
  # パスワードは英数字混合
  password_spell_valid = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  # 全角（ひらがな、カタカナ、漢字）
  zenkaku_valid = /\A[ぁ-んァ-ン一-龥々ー]/
  # 全角カタカナ
  kana_valid = /\A[ァ-ヶー－]+\z/
  # 郵便番号（全て数字＆7桁）
  postal_code  = /\A\d{7}\z/
  # 電話番号（全て数字＆10〜11桁）
  phone_number_num  = /\A\d{10,11}\z/

  # バリデーション設定
  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_date
    validates :sex_id
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end
  validates :last_name_kana, format: { with: kana_valid }
  validates :first_name_kana, format: { with: kana_valid }
  validates :postal_code, numericality:  {only_integer: true}, length: { is: 7 }
  validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :phone_number, numericality:  {only_integer: true}, length: { in: 10..11 }
end
