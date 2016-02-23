class PricesController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @periodicity = Periodicity.find(params[:periodicity_id])
    @price = Price.create(plan_id: @plan.id,
                          periodicity_id: @periodicity.id,
                          value: params[:value])
    respond_with @price
  end

  def show
    @price = Price.find(params[:id])
    respond_with @price
  end

  def index
    @prices = Price.where(plan_id: params[:plan_id],
                          periodicity_id: params[:periodicity_id]).order(id: :desc)
    respond_with @prices
  end
end
