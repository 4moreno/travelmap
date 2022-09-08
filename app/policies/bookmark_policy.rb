class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      scope.where(user: user)
      # @bookmarks[0].wishlist.user
    end
  end

  def create?
    # user = current_user
    # record = Bookmark instance
    adding_to_own_wishlist?
  end

  def destroy?
    adding_to_own_wishlist?
  end

  private

  def adding_to_own_wishlist?
    record.wishlist == user.wishlist
  end
end
