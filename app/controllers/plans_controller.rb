class PlansController < ApplicationController
  def index
    @plans = Plan.all
    respond_with @plans
  end

  def show
    @plan = Plan.find(params[:id])
    respond_with PlanDecorator.new(@plan)
  end

  def create
    @plan = Plan.create(name: params[:name], description: params[:description], details: params[:details], product_id: params[:product_id])
    respond_with @plan
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(name: params[:name], description: params[:description], details: params[:details], product_id: params[:product_id])
    respond_with @plan
  end
end
