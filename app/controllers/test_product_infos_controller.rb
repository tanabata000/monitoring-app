class TestProductInfosController < ApplicationController
  def new
    # モデル新規レコード作成、@変数に代入
    @test_product_info = TestProductInfo.new
  end

  def create
    # モデル新規レコードにパラメータを入力し保存
    @product = Product.find(params[:product_id])
    @test_product_info = TestProductInfo.new(test_product_info_params)
    if @test_product_info.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def test_product_info_params
    # パラメータ作成（対象：prototype,カラム：:title,  :image、紐付：user_id: current_user.id
    params.permit().merge(product_id: params[:product_id], tester_id: current_tester.id )
  end
    
end
