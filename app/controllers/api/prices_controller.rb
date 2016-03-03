module Api
  class PricesController < ApiController
    before_action :set_plan, only: [:index, :create]
    
    def create
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
      @periodicities = @plan.periodicities
      @prices = @periodicities.map do |periodicity|
        PeriodicityDecorator.new(periodicity, @plan)
      end
      respond_with @prices.map(&:to_json)
    end

    def set_plan
      @plan = Plan.find(params[:plan_id])
    end
  end
end
