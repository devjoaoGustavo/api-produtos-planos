module Api
  class PlansController < ApiController
    def index
      @plans = Plan.all
      respond_with @plans
    end

    def show
      @plan = Plan.find(params[:id])
      respond_with PlanDecorator.new(@plan)
    end

    def create
      @plan = Plan.create(plan_params)
      respond_with :api, @plan
    end

    def update
      @plan = Plan.find(params[:id])
      @plan.update(plan_params)
      respond_with @plan
    end

    private

    def plan_params
      params.require(:plan).permit(:name, :description, :details, :product_id)
    end
  end
end