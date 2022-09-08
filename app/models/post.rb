class Post < ApplicationRecord
  CATEGORIES = ["Art&Culture", "Restaurant", "Outdoors", "Best spots"]
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

  include AlgoliaSearch

  algoliasearch per_environment: true do
    # the list of attributes sent to Algolia's API
    attribute :id, :title, :description, :category, :address, :city_id, :user_id, :created_at, :updated_at

    # integer version of the created_at datetime field, to use numerical filtering
    attribute :created_at_i do
      created_at.to_i
    end

    attribute :city_name do
      city.name
    end

    # `title` is more important than `{story,comment}_text`, `{story,comment}_text` more than `url`, `url` more than `author`
    # btw, do not take into account position in most fields to avoid first word match boost
    searchableAttributes ['unordered(title)', 'unordered(category)', 'unordered(description)', 'unordered(city_name)']

      # tags used for filtering
    tags do
      ["title_#{title}", "description_#{description}", "category_#{category}", "city_id_#{city_id}"]
    end
  end

  before_validation :geocode, if: :will_save_change_to_address?

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
