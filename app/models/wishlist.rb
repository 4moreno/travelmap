class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :posts, through: :bookmarks
  geocoded_by :address do |obj,results|
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
