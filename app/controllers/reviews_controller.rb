class ReviewsController < ApplicationController
  def index
    query = "SELECT * FROM reviews ORDER BY created_at DESC"
    @reviews = Review.find_by_sql(query)
  end

  def show
    @review = Review.find(params[:id])
    @test_product_info = TestProductInfo.find(@review.test_product_info_id)
  end
  
  def new

    @test_product_info = TestProductInfo.find(params[:test_product_info_id])
    @review = Review.new
  end

  def create
    
    @test_product_info = TestProductInfo.find(params[:test_product_info_id])
    @product = @test_product_info.product_id
    @tester = @test_product_info.tester_id
    @review = Review.new(review_params)
    if @review.save
      redirect_to controller: :products, action: :show, id: @product
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def review_params
    params.require(:review).permit(:good_review, :bad_review, :opinions_requests ).merge(test_product_info_id: @test_product_info.id, product_id: @product, tester_id: @tester )
  end
end
