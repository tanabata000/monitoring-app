class ReviewOnReview < ApplicationRecord
  belongs_to :company
  belongs_to :tester
  belongs_to :review

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :review_category
end
