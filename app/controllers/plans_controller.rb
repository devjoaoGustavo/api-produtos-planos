class PlansController < ApplicationController
  def index
    @plans = Plan.all
    plans_decorated = []
    @plans.each do |plan|
      plans_decorated << PlanDecorator.new(plan)
    end

    respond_with plans_decorated.map(&:to_json)
  end

  def show
    @plan = Plan.find(params[:id])
    respond_with PlanDecorator.new(@plan)
  end

  def create
    @plan = Plan.create(plan_params)
    respond_with @plan
  end

  def create_price
    @plan = Plan.find(params[:id])
    @periodicity = Periodicity.create(name: 'mensal', deadline: 1)
    # @price = @plan.prices.create(value: params[:price][:value],
    #                              periodicity: params[:periodicity])
    @plan.periodicities << @periodicity
    @price = @plan.prices.where(periodicity_id: @periodicity.id)
    @price.value = 1.99
    binding.pry
    respond_with @price
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :details, :product_id)
  end

  def price_params
    params.require(:price).permit(:value, :periodicity_id)
  end
end
