class ProductsController < ApplicationController
  before_action :product_find, except: [:index, :new, :create]

  def index
    query = "SELECT * FROM products ORDER BY created_at DESC"
    @products = Product.find_by_sql(query)
  end

  def new
    # モデル新規レコード作成、@変数に代入
    @product = Product.new
  end

  def create
    # モデル新規レコードにパラメータを入力し保存
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @tester = current_tester
    @test_product_info = TestProductInfo.find_by(product_id:@product.id, tester_id:@tester.id )
  end

  private
  def product_params
    # パラメータ作成（対象：prototype,カラム：:title,  :image、紐付：user_id: current_user.id
    params.require(:product).permit(:pd_image, :pd_name, :pd_info, :pd_category_id, :pd_stock, :pd_review_reward ).merge(company_id: current_company.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end

  # def product_find
  #   @product = Product.find(params[:id])
  #   if @product.test_product_infos.tester_id.present? == true
  #     @tester = @product.test_product_infos.tester_id.count
  #     @product_count == @product.pd_stock.count - @tester
  #   end
  # end

end
