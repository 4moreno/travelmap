class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one :wishlist
  has_many :bookmarks, through: :wishlist

  after_create :create_wishlist

  private

  def create_wishlist
    Wishlist.create(user: self)
  end
end
