class Trip < ApplicationRecord
    belongs_to :getaway
    validates :duration, numericality: true

end
