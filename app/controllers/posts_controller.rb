class PostsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: [:show, :index, :new, :create,]
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
    #@posts = Post.all
    respond_with(@posts)
  end

  def show
    @comment = @post.comments.new
    #@comment = Comment.new(post_id: @post.id)
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    authorize @post
  end

  def create
    @post = Post.create(post_params.merge(user_id: current_user.id))
    respond_with(@post)
  end

  def update
    authorize @post
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    authorize @post
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :tag_list)
    end
end
