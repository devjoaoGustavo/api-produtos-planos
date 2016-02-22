class ProductDecorator < ApplicationDecorator
  def to_json(_options = {})
    super(links)
  end

  private

  def links
    { 'plans_path' => product_plans_path(__getobj__) }
  end
end
