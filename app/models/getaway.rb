class Getaway < ApplicationRecord
    belongs_to :user
    belongs_to :travel_agency, optional: true
    has_many :accommodations
    has_many :excursions
    has_many :trips
    scope :flights, -> { joins(:trips).where('trips.flight = true') }
    scope :road_trips, -> { joins(:trips).where('trips.road_trip = true') }

    accepts_nested_attributes_for :trips, :accommodations

end
