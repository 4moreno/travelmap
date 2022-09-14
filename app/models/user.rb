class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one :wishlist
  has_many :events
  has_many :bookmarks, through: :wishlist
  has_many :messages
  has_many :attendances
  has_one_attached :avatar


  after_create :create_wishlist

  private

  def create_wishlist
    Wishlist.create(user: self)
  end
end
