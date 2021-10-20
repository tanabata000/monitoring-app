class Review < ApplicationRecord
  belongs_to :test_product_info
  belongs_to :product
end
