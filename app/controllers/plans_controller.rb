class PlansController < ApplicationController
  def new
    @products = Product.all
    @plan = Plan.new
  end

  def create
    plan_params[:product_id] = Product.create(name: 'Produto',
                                              description: 'Descrição',
                                              image: File.open('spec/support/images/image.jpg'))
    @plan = Plan.new(plan_params)
    plan_params.each do |detail|
      @plan.details << detail[1]
    end
    @plan.save
    respond_with @plan
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
    @periodicities = Periodicity.all
    @plan.prices.build
  end

  def update
    @periodicities = Periodicity.all
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    respond_with @plan
  end

  private

  def plan_params
    params.require(:plan).permit(:name,
                                 :description,
                                 :product_id,
                                 { prices_attributes: [:periodicity_id, :value] },
                                 details: [])
  end
end
