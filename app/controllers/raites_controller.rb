class RaitesController < ApplicationController
  before_action :set_post

  def create
    @raite = @post.raites.create(raite_params.merge(user_id: current_user.id))
    respond_with(@raites, location: @post)
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def raite_params
      params.require(:raite).permit(:value)
    end
end
