class TestProductInfo < ApplicationRecord
  belongs_to :product
  belongs_to :tester
  has_one :review
end
