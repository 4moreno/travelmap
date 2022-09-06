class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @posts = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), status: :see_other, notice: "You successfully created the post: #{@post.title}"
    else
      render 'new'
    end
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category, :address)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
