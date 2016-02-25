module Api
  class ProductsController < ApiController
    def create
      @product = Product.create(product_params)
      respond_with :api, @product
    end

    def index
      @products = Product.all
      respond_with @products
    end

    def show
      @product_decorated = ProductDecorator.new(Product.find(params[:id]))
      @plans = @product_decorated.plans.map do |plan|
        PlanDecorator.new(plan)
      end

      @response = { product: @product_decorated.to_json,
                    plans: @plans.map { |plan| plan.to_json('prices_path') } }
      respond_with @response
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
end
