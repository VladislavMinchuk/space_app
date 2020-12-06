class Astronaut < ApplicationRecord
  validates :first_name, :last_name, :birthday, :country_id, presence: true

  belongs_to :country
end
