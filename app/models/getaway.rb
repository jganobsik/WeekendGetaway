class Getaway < ApplicationRecord
    belongs_to :user,
    has_many :accomodations, 
    has_many :excursions,
    has_many :trips,


end
