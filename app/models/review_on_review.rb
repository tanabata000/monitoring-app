class ReviewOnReview < ApplicationRecord
  belongs_to :company
  belongs_to :tester
end
