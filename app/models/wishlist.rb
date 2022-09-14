class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :posts, through: :bookmarks
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
