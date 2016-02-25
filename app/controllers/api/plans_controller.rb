module Api
  class PlansController < ApiController
    def index
      @plans = Plan.where(product_id: params[:product_id]).map do |plan|
        PlanDecorator.new(plan)
      end
      respond_with @plans.map { |plan| plan.to_json('prices_path') }
    end

    def show
      @plan = PlanDecorator.new(Plan.find(params[:id])).to_json
      respond_with @plan
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
