class ProductsController < ApplicationController
  def create
    @product = Product.create(product_params)
    respond_with @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end

end
