class Post < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmarks

  include PgSearch::Model

  pg_search_scope :search_by_title_description_and_category,
    against: [ :title, :description, :category ],
    using: {
      tsearch: { prefix: true }
    }
end
