class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Post)
    if params[:query].present?
      @posts = Post.global_search(params[:query])
    else
      @posts = Post.all
    end
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "info_window", locals: { post: post }),
        image_url: helpers.asset_url("logo-peach.png")
      }
    end
  end

  def show
    @markers = [{
      lat: @post.latitude,
      lng: @post.longitude,
      info_window: nil
    }]
    # @markers = @post.geocoded.map do |post|
    #   {
    #     lat: post.latitude,
    #     lng: post.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { post: post })
    #   }
    # end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.valid?
      @post.save
      redirect_to post_path(@post), status: :see_other, notice: "You successfully created the post: #{@post.title}"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), status: :see_other, notice: "You successfully updated the post: #{@post.title}"
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, status: :see_other, notice: "You successfully deleted the product: #{@post.title}"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category, :address, photos:[])
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end
end
