require 'faker'

# Define the number of records you want to create
num_records = 1000

num_records.times do
  Earthquake.create(
    date: Faker::Date.between(from: '2020-01-01', to: '2024-12-31'),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    depth: Faker::Number.decimal(l_digits: 2),
    location: Faker::Address.city,
    magnitude: Faker::Number.decimal(l_digits: 1)
  )
end

puts "Generated #{num_records} earthquake records."