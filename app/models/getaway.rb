class Getaway < ApplicationRecord
    belongs_to :user
    belongs_to :travel_agency, optional: true
    has_many :accommodations
    has_many :excursions
    has_many :trips

    accepts_nested_attributes_for :trips, :accommodations

end
