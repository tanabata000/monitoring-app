class ReviewOnReviewsController < ApplicationController
  def index
    @test_product_info = TestProductInfo.find(params[:test_product_info_id])
    @product = @test_product_info.product_id
    @tester = @test_product_info.tester_id
    @reviews = Review.where(product_id: @product).order("created_at DESC")
    # @reviews = Review.find_by(reviews)
  end

  def new
  end
  
  def create
  end

end
