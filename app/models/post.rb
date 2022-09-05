class Post < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmarks
end
