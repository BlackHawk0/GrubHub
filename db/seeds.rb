# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Start✍🏻 seeding...📝"
puts "======================================================="
  5 .times do
drink = Drink.create( description: Faker::Markdown.emphasis, price: Faker::Number.decimal(l_digits: 2))
  end

puts "✅ Done seeding 🌱"
