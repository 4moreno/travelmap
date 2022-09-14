class Post < ApplicationRecord
  CATEGORIES = ["Art&Culture", "Restaurants", "Outdoors", "Best spots", "Entertaiments"]
  belongs_to :city
  belongs_to :user
  has_many :bookmarks
  has_many_attached :photos
  # validates :city, presence: true
  validates :title, presence: true
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title, :description, :category, :city_id ],
  associated_against: {
    city: :name
  },
  using: {
    tsearch: { prefix: true }
  }

  before_validation :geocode, if: :will_save_change_to_address?

  geocoded_by :address do |obj, results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      city_obj = City.find_by(name: geo.city)
      # obj.city = city_obj ? city_obj : City.new(name: geo.city)

      if city_obj
        obj.city = city_obj
      else
        obj.city = City.new(name: geo.city)
      end
    end
  end
end
