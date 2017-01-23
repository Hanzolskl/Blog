class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :json, only: [:update]
  respond_to :html, except: [:update]
  #respond_to :js, only: [:update]

  def index
    @comments = @post.comments.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = @post.comments.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_with(@comment, location: @post)
  end

  def update
    @comment.update(comment_params)
    #respond_with(@post, @comment)
    render json: @comment
  end

  def destroy
    #if (current_user.id == @comment.user_id)
      @comment.destroy
      respond_with(@comment, location: @post)
   # else
     # flash[:alert] = "It's note your comment"
      #redirect_to @post
    #end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
