class ProductDecorator < ApplicationDecorator
  def to_json(_options = {})
    super(links)
  end

  private

  def links
    { 'plans_path' => api_product_plans_path(__getobj__) }
  end
end
