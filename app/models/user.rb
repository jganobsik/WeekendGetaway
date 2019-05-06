class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    has_many :getaways,
    has_many :trips, through: :getaways
    has_many :accommodations, through: :getaways
    has_many :excursions, through: :getaways

end
