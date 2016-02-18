class PlansController < ApplicationController
  def index
    @plans = Plan.all
    respond_with @plans
  end

  def show
    @plan = Plan.find(params[:id])
    respond_with @plan
  end

  def create
    @plan = Plan.create(plan_params)
    respond_with @plan
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :details)
  end
end
