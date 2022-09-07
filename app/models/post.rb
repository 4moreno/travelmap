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












end
