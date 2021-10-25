class Product < ApplicationRecord
  # アソシエーション設定
  belongs_to :company
  has_many :reviews
  has_one :test_product_info
  
  # Active Storageのアソシエーション設定
  has_one_attached :pd_image

  # ActiveHashのアソシエーション設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pd_category
  belongs_to :prefecture
  belongs_to :sex
  belongs_to :review_category


  # 正規表現
  # 全て半角数字
  hankaku_num = /\A[0-9]+\z/
  # バリデーション設定
  with_options presence: true do
    validates :pd_image
    validates :pd_name
    validates :pd_info
    validates :pd_category_id
    validates :pd_stock
    validates :pd_review_reward
  end
  validates :pd_category_id, numericality: { other_than: 1}
  validates :pd_stock, numericality: { with: hankaku_num }
  validates :pd_review_reward, numericality: { with: hankaku_num }
  validates_inclusion_of :pd_review_reward, in: 500..9_999_999
end
