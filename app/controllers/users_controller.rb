class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to root_path
    end

    @posts = current_user.posts
    authorize @posts
  end
end
