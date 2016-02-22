class ProductsController < ApplicationController
  def create
    @product = Product.create(product_params)
    respond_with @product
  end

  def index
    @products = Product.all
    respond_with @products
  end

  def show
    @product_decorated = ProductDecorator.new(Product.find(params[:id]))
    respond_with @product_decorated
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
