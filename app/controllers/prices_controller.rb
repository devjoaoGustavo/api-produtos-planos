class PricesController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @periodicity = Periodicity.find(params[:periodicity_id])
    @price = Price.create(plan_id: @plan.id,
                          periodicity_id: @periodicity.id,
                          value: params[:value])
    respond_with @price, location:
      -> { plan_periodicity_price_path(@plan, @periodicity, @price) }
  end

  def show
    @price_decorated = PriceDecorator.new(Price.find(params[:id]))
    respond_with @price_decorated
  end
end
