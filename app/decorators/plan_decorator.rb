class PlanDecorator < ApplicationDecorator
  def to_json(option = nil)
    super option ? link_show(option) : links
  end

  private

  def links
    { 'product_path' => api_product_path(__getobj__.product),
      'prices_path' => api_plan_prices_path(__getobj__) }
  end

  def link_show(path)
    { 'plan_path' => api_plan_path(__getobj__),
      path => api_plan_prices_path(__getobj__) }
  end
end
