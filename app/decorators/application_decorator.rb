class ApplicationDecorator < SimpleDelegator
  include Rails.application.routes.url_helpers

  def to_json(links)
    JSON.parse(__getobj__.to_json).merge(links).to_json
  end
end
