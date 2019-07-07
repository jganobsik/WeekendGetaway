class TravelAgencySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :getaways
end
