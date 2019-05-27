class Trip < ApplicationRecord
    belongs_to :getaway
    scope :road_trip, -> { where(road_trip: true) }
    scope :flight, -> { where(flight: true) }
end
