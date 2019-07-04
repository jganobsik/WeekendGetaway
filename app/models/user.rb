class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    has_many :getaways
    has_many :trips, through: :getaways
    has_many :accommodations, through: :getaways
    has_many :excursions, through: :getaways
    has_many :travel_agencies, through: :getaways
    scope :top_two, -> { joins(:getaways).group('users.id').order('COUNT(users.id) desc').limit(2) }
end
