class PlansController < ApplicationController
  def create
    @plan = Plan.create(plan_params)
    respond_with @plan
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :description, :details)
  end
end
