class PlansController < ApplicationController
  def index
    @plans = Plan.all
    plans_decorated = []
    @plans.each do |plan|
      # binding.pry
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

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :details, :product_id)
  end
end
