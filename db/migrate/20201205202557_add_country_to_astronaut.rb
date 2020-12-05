class AddCountryToAstronaut < ActiveRecord::Migration[6.0]
  def change
    add_reference :astronauts, :country
  end
end
