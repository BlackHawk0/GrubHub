# Seed the database with fake data
def seed_database
  # Clear existing data
  puts "seeding data.."
  puts "Cleaning database"
  Meal.delete_all
  Category.delete_all
  CategoryMeal.delete_all

  # Create meals
  puts 'generating meals'
  20.times do
    Meal.create(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: Faker::Commerce.price,
    image_url: Faker::LoremFlickr.image
    )

  end

  # Create categories
  puts 'generating categories'
  5.times do
    Category.create(
      name: Faker::Food.ingredient,
      image_url: Faker::LoremFlickr.image
    #   image_url: Faker::LoremPixel.image
    )
  end

  # Create category meals
  puts 'generating category meals'
  Category.all.each do |category|
    category.meals << Meal.order("RANDOM()").first(3)
  end
  puts 'done'
end

seed_database
