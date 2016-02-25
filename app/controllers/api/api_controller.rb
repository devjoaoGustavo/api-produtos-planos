require 'application_responder'

module Api
  class ApiController < ApplicationController
    respond_to :json
  end
end
