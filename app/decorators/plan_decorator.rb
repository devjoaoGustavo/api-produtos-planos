class PlanDecorator < SimpleDelegator
  include Rails.application.routes.url_helpers

  def to_json(_options = {})
    JSON.parse(__getobj__.to_json).merge(links).to_json
  end

  private

  def links
    { 'product_path' => product_path(__getobj__.product) }
  end
end
