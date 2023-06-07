# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Clear database...'
Restaurant.destroy_all

puts 'Creating restaurants'

my_array = %w[chinese italian japanese french belgian]
10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number.to_s,
    category: my_array.sample
  )
  10.times do
    restaurant.reviews.create(
      content: Faker::RickAndMorty.quote,
      rating: (0..5).to_a.sample
    )
  end
  puts "Restaurant with id: #{restaurant.id} has been created"
end

puts 'Finished'
