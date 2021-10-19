class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @products = @company.products.includes(:company)
  end
end
