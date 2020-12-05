class AddForeignKeyToAstronaut < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :astronauts, :countries
  end
end
