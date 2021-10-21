class ReviewOnReviewsController < ApplicationController
  def index
    @test_product_info = TestProductInfo.find(params[:test_product_info_id])
    @product = @test_product_info.product_id
    @tester = @test_product_info.tester_id
    @reviews = Review.where(product_id: @product).order("created_at DESC")
    # @reviews = Review.find_by(reviews)
  end

  def new
    @test_product_info = TestProductInfo.find(params[:test_product_info_id])
    @product = @test_product_info.product
    @tester = @test_product_info.tester
    @review = Review.find_by(test_product_info_id: @test_product_info)
    @review_on_review = ReviewOnReview.new
  end
  
  def create
    @test_product_info = TestProductInfo.find(params[:test_product_info_id])
    @product = @test_product_info.product
    @tester = @test_product_info.tester
    @review = Review.find_by(test_product_info_id: @test_product_info)
    @review_on_review = ReviewOnReview.new(review_on_review_params)
    if @review_on_review.save
      redirect_to test_product_info_review_on_reviews_path
    else
      render :new
    end
  end

  private
  def review_on_review_params
    params.require(:review_on_review).permit(:review_category_id ).merge(company_id: @product.company_id, review_id: @review.id, tester_id: @tester.id )
  end

end
