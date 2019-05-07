class Getaway < ApplicationRecord
    belongs_to :user,
    belongs_to :travel_agency, optional: true
    has_many :accomodations, 
    has_many :excursions,
    has_many :trips,


end
