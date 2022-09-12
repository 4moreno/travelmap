class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to root_path
    end

    @posts = current_user.posts
    authorize @posts

    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        city: post.city_id,
        filter_cards: true
      }
    end
  end
end
