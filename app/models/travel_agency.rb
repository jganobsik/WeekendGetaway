class TravelAgency < ApplicationRecord
    has_many :getaways

    has_many :trips, through: :getaways
    has_many :accommodations, through: :getaways
    has_many :excursions, through: :getaways


end
