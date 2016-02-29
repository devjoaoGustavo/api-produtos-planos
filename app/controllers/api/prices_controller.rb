module Api
  class PricesController < ApiController
    def create
      @plan = Plan.find(params[:plan_id])
      @periodicity = Periodicity.find(params[:periodicity_id])
      @price = Price.create(plan_id: @plan.id,
                            periodicity_id: @periodicity.id,
                            value: params[:value])
      respond_with :api, @price
    end

    def show
      @price_decorated = PriceDecorator.new(Price.find(params[:id])).to_json
      respond_with @price_decorated
    end

    def index
      @prices = Price.in_order(params[:plan_id], params[:periodicity_id])
      respond_with @prices
    end
  end
end
