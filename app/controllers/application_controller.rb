require "application_responder"
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  respond_to :html
  protect_from_forgery with: :exception

  def average_rating
    raites_size = @post.raites.size
    if raites_size !=
      sum_rating = 0
      @post.raites.each do |elem|
        elem_value = elem.value
        sum_rating = elem_value + sum_rating
      end
      @rating = sum_rating/raites_size
    else
      @raiting = 0
    end
  end
  helper_method :average_rating

  def user_not_authorized
    render plain: 'It is not your record', status: :unauthorized
  end
end
