class PlanDecorator < ApplicationDecorator
  def to_json(_options = {})
    super(links)
  end

  private
  
  def links
    { 'product_path' => product_path(__getobj__.product) }
  end
end
