class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create( post_params )
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "Your post must include a title!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update( post_params )
      flash[:success] = "Your post has been updated."
      redirect_to @post
    else
      flash[:alert] = "There was in error in updating your post. Please try again."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find( params[:id] )
  end

end
