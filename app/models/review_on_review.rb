class ReviewOnReview < ApplicationRecord
  belongs_to :company
  belongs_to :tester
  belongs_to :review

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :review_category
  
  # バリデーション
  validates :review_category_id, presence: true
  validates :review_category_id, numericality: { other_than: 1}
end