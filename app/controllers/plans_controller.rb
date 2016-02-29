class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update]

  def new
    @products = Product.all
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)

    save_details @plan
    respond_with @plan
  end

  def show
  end

  def edit
    @periodicities = Periodicity.all
    @price = @plan.prices.build
  end

  def update
    @periodicities = Periodicity.all
    @plan.update(plan_params)
    @plan.prices.create(periodicity_id: price_params[:prices][:periodicity_id],
                        value: price_params[:prices][:value])
    save_details @plan
    respond_with @plan
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :description,
                                 :product_id, details: [])
  end

  def price_params
    params.require(:plan).permit(prices: [:periodicity_id, :value])
  end

  def save_details(plan)
    params[:plan][:details].each do |detail|
      plan.details << detail[1]
    end if params[:plan][:details]
    plan.save
  end
end
