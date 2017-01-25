require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  include Pundit
  respond_to :html
  protect_from_forgery with: :exception
end
