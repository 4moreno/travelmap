class Event < ApplicationRecord
  has_one :chatroom, dependent: :destroy
  belongs_to :user
  belongs_to :city
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances

  validates :start_time, presence: true
  validates :end_time, presence: true

  before_validation :geocode, if: :will_save_change_to_address?

  after_create :set_chatroom

  default_scope -> { order(:start_time) }

  include PgSearch::Model
  pg_search_scope :filter_by_city,
  against: [:city_id],
  associated_against: {
    city: :name
  },
  using: {
    tsearch: { prefix: true }
  }

  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end

  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end

  def set_chatroom
    Chatroom.create(name: name, event: self)
  end

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
