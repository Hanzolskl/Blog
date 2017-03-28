require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  include Pundit
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  respond_to :html
  protect_from_forgery with: :exception
  #def user_not_authorized
  #  flash[:alert] = "You are not authorized to perform this action."
  #  redirect_to(request.referrer || root_path)
  #end
end
