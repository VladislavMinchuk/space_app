class AstronautSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :country

  class CountrySerializer < ActiveModel::Serializer
    attributes :id, :country_name
  end
end