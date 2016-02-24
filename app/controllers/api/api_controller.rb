require 'application_responder'

module Api
  class ApiController < ApplicationController
    # protect_from_forgery with: :exception
    respond_to :json
  end
end
