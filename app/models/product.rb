class Product < ApplicationRecord
  # アソシエーション設定
  belongs_to :company
  has_many :reviews
  # Active Storageのアソシエーション設定
  has_one_attached :pd_image

  # ActiveHashのアソシエーション設定
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pd_category
  belongs_to :prefecture
  belongs_to :sex
  belongs_to :review_category

  # バリデーション設定
  validates :pd_image, presence: true

end
