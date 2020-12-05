class AstronautSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :birthday
  belongs_to :country

  class CountrySerializer < ActiveModel::Serializer
    attributes :english_name
  end
end