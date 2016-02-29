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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    respond_with @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
