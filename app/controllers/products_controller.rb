class ProductsController < ApplicationController
  def create
    @product = Product.create(name: params[:name],
                              description: params[:description],
                              image: File.open(params[:image]))
    respond_with @product
  end

  def index
    @products = Product.all
    respond_with @products
  end

  def show
    @plans = Plan.where('product_id = ?', params[:id])
    @product_decorated = ProductDecorator.new(Product.find(params[:id]))

    @response = { product: JSON.parse(@product_decorated.to_json),
                  plans: @plans }
    respond_with @response
  end

  def update
    @product = Product.find(params[:id])
    @product.update(name: params[:name],
                    description: params[:description],
                    image: params[:image])
    respond_with @product
  end
end
