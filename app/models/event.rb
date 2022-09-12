class Event < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :start_time, presence: true
  validates :end_time, presence: true
end
