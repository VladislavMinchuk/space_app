# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create({ country_name: 'Ukraine' })
Country.create({ country_name: 'Italy' })
Country.create({ country_name: 'England' })
Country.create({ country_name: 'USA' })

Astronaut.create({ name: 'Adam', country_id: '2' })
Astronaut.create({ name: 'Ivan', country_id: '1' })