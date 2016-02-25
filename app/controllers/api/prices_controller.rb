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
      @plan = Plan.find(params[:plan_id])
      @periodicities = @plan.periodicities.uniq.map do |periodicity|
        PeriodicityDecorator.new(periodicity, @plan)
      end
      @prices = @periodicities.map(&:to_json)

      respond_with @prices
    end
  end
end
