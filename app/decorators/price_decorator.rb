class PriceDecorator < ApplicationDecorator
  def to_json(_options = {})
    super(links)
  end

  private

  def links
    { 'plan_path' => plan_path(__getobj__.plan),
      'periodicity_path' => periodicity_path(__getobj__.periodicity) }
  end
end
