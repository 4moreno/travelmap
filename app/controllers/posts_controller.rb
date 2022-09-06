class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def create
  end

  def new
  end

  def edit
    authorize @post
  end

  def update
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:title, :description, :category, :address)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
