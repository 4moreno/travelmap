class WishlistsController < ApplicationController
  def index
    redirect_to root_path unless current_user
    @wishlist = current_user.wishlist
    authorize @wishlist
    @posts = policy_scope(Post)
    @posts = @wishlist.posts
    # authorize @posts

  # The `geocoded` scope filters only flats with coordinates
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        image_url: helpers.asset_url("logo-peach.png")
      }
    end
  end
end
