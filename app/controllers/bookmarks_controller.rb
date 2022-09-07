class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new
    @bookmark.wishlist = current_user.wishlist
    @post = Post.find(params[:post_id])
    @bookmark.post = @post
    authorize @bookmark
    if @bookmark.save
      redirect_to post_path(@post), status: :see_other, notice: "You successfully added #{@post.title} to wishlist!"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      redirect_to post_path(@bookmark.post), status: :see_other, notice: "You successfully removed #{@bookmark.post.title} from wishlist!"
    end
  end
end
