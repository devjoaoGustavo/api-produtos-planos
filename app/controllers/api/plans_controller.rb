module Api
  class PlansController < ApiController
    def index
      @plans = Plan.where(product_id: params[:product_id])
      respond_with @plans
    end

    def show
      @plan = PlanDecorator.new(Plan.find(params[:id]))

      @periodicities = @plan.periodicities.uniq.map do |periodicity|
        PeriodicityDecorator.new(periodicity, @plan)
      end
      @response = { plan: @plan, periodicities: @periodicities.map(&:to_json) }
      respond_with @response
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
