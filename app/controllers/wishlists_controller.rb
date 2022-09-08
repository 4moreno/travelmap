class WishlistsController < ApplicationController
  def index
    @bookmarks = policy_scope(Bookmark)
    @posts = Post.all
  end
end
