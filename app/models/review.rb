class Review < ApplicationRecord
  belongs_to :test_product_info
  belongs_to :product
  has_one :review_on_review

  # バリデーション設定
  with_options presence: true do
    validates :good_review
    validates :bad_review
  end

end
