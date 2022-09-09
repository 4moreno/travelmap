class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Post)
    if params[:query].present?
      @posts = raw_algolia_search(params[:query])
    else
      @posts = Post.all
    end
    if params[:query].present?
      @markers = @posts.map do |post|
        {
          lat: post.latitude,
          lng: post.longitude,
          info_window: render_to_string(partial: "info_window", locals: { post: post }),
        }
      end
    else
      @markers = @posts.geocoded.map do |post|
        {
          lat: post.latitude,
          lng: post.longitude,
          info_window: render_to_string(partial: "info_window", locals: { post: post }),
        }
      end
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

  def raw_algolia_search(query)
    search_options = {
      attributesToHighlight: ['*']
    }
    raw_hits = Post.raw_search(query, search_options)["hits"]
    raw_hits.map! do |hit, index|

      highlighted_res = hit["_highlightResult"]
      # new_post = Post.new(
      #   id: index,
      #   title: highlighted_res["title"]["value"],
      #   description: highlighted_res["description"]["value"],
      #   category: highlighted_res["category"]["value"],
      #   address: highlighted_res["address"]["value"],
      #   # city_name: highlighted_res["city_name"]["value"]
      # )
      # new_post.geocode
      Post.find(hit["id"])
    end
  end

  def post_params
    params.require(:post).permit(:title, :description, :category, :address, photos:[])
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end
end

def strip_tags(html)
  self.class.full_sanitizer.sanitize(html)
end
