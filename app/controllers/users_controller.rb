class UsersController < ApplicationController
  def show
    redirect_to root_path unless current_user
    @posts = current_user.posts
    authorize @posts
    geocode
  end

  def geocode
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        city: post.city_id,
        image_url: helpers.asset_url("logo-peach.png"),
        filter_cards: true
      }
    end
  end
end
