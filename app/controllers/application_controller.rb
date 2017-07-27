require "application_responder"
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  respond_to :html
  protect_from_forgery with: :exception
  def user_not_authorized
    render plain: 'It is not your record', status: :unauthorized
  end
end
