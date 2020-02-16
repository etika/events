class Event < ApplicationRecord
  validates_presence_of :name, :location, :event_date, :fees
  has_many :user_events
  has_many :users , through: :user_events
  belongs_to :event_category
end
