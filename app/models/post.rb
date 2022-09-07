class Post < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmarks

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title, :description, :category, :city_id ],
  associated_against: {
    city: :name
  },
  using: {
    tsearch: { prefix: true }
  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
