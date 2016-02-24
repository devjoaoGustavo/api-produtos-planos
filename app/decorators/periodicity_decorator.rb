class PeriodicityDecorator < ApplicationDecorator
  def initialize(periodicity, plan)
    @plan = plan
    super(periodicity)
  end

  def to_json(_options = {})
    super(links)
  end

  private

  def links
    { 'value' => Price.where(plan_id: @plan.id,
                             periodicity: id).last.value }
  end
end
