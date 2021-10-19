class ReviewsController < ApplicationController
  def new
    
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
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
    # パラメータ作成（対象：prototype,カラム：:title,  :image、紐付：user_id: current_user.id
    params.require(:review).permit(:good_review, :bad_review, :opinions_requests ).merge(test_product_info_id: params[:test_product_info_id])
  end
end
