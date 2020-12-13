class AstronautSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :birthday
  belongs_to :country

  class CountrySerializer < ActiveModel::Serializer
    attributes :english_name
  end
end