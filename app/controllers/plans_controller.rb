class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update]
  before_action :set_periodicities, only: [:edit, :update]
  before_action :set_resources, only: [:edit, :update]
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
    @price = @plan.prices.build
  end

  def update
    @plan.update(plan_params)
    price_create(@plan)
    save_details @plan
    respond_with @plan
  end

  private

  def set_periodicities
    @periodicities = Periodicity.all
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def set_resources
    @periodicities = Periodicity.all
  end

  def plan_params
    params.require(:plan).permit(:name, :description,
                                 :product_id, details: [])
  end

  def price_params
    params.require(:plan).permit(prices: [:periodicity_id, :value])
  end

  def save_details(plan)
    plan.details = params[:plan][:details]
                   .map { |detail| detail } if params[:plan][:details]
    plan.save
  end

  def price_create(plan)
    plan.prices.create(periodicity_id: price_params[:prices][:periodicity_id],
                       value: price_params[:prices][:value]) if
                         price_params[:prices][:value].present?
  end
end
