class Wishlist < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :posts, through: :bookmarks
  has_many :bookmarks
end
