class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    respond_with @product
  end

  def show
    @product = Product.find(params[:id])
    respond_with @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
