require "application_responder"
class ApplicationController < ActionController::Api
  self.responder = ApplicationResponder
  respond_to :json
end
