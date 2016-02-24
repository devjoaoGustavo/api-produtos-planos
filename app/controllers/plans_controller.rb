class PlansController < ApplicationController
  def new
    @products = Product.all
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    # params[:plan][:details].split("\n").each do |detail|
    #   @plan.details << detail
    # end
    @plan.details << params[:plan][:details]
    @plan.save
    respond_with @plan
  end

  def show
    @plan = Plan.find(params[:id])
  end

  private

  def plan_params
    params.require(:plan).permit(:name,
                                 :description,
                                 :product_id,
                                 details: [])
  end
end
