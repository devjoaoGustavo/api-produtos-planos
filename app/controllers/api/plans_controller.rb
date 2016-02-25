module Api
  class PlansController < ApiController
    def index
      @plans = Plan.where(product_id: params[:product_id]).map do |plan|
        PlanDecorator.new(plan)
      end
      respond_with @plans.map { |plan| plan.to_json('prices_path') }
    end

    def show
      @plan = PlanDecorator.new(Plan.find(params[:id]))

      @periodicities = @plan.periodicities.uniq.map do |periodicity|
        PeriodicityDecorator.new(periodicity, @plan)
      end

      @response = response_json(@plan, @periodicities)

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

    def response_json(plan, periodicities)
      if periodicities.present?
        { plan: plan.to_json,
          periodicities: periodicities.map(&:to_json) }
      else
        { plan: plan.to_json }
      end
    end

    def plan_params
      params.require(:plan).permit(:name, :description, :details, :product_id)
    end
  end
end
