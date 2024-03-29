class CreateAstronauts < ActiveRecord::Migration[6.0]
  def change
    create_table :astronauts do |t|
      t.string :name
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
