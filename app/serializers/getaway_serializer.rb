class GetawaySerializer < ActiveModel::Serializer
  attributes :id, :days, :title

  belongs_to :travel_agency
end
