countries = [
  'Australia',
  'Belgium',
  'Canada',
  'Denmark',
  'France',
  'Germany',
  'Iceland',
  'Italy',
  'Japan',
  'Monaco',
  'Ukraine',
  'United States of America',
]

# Insert list of countries
countries.each { |country|
  Country.find_or_create_by(english_name: country)
}