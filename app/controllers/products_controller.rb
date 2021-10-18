class ProductsController < ApplicationController
  before_action :item_find, except: [:index, :new, :create]

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
    binding.pry
    @product.save
    binding.pry
    
    # if @product.save
      # redirect_to root_path
    # else
    #   render :new
    # end

  end

  private
  def product_params
    # パラメータ作成（対象：prototype,カラム：:title,  :image、紐付：user_id: current_user.id
    params.require(:product).permit(:pd_image, :pd_name, :pd_info, :pd_category_id, :pd_stock, :pd_review_reward ).merge(company_id: current_company.id)
  end

  def item_find
    @product = Product.find(params[:id])
  end
end
