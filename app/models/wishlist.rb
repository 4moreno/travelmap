class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :posts, through: :bookmarks
end
