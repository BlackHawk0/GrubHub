# Seed the database with fake data
def seed_database
  # Clear existing data
  puts "seeding data.."
  puts "Cleaning database"
  Meal.delete_all
  Category.delete_all
  # CategoryMeal.delete_all

  # Create meals
  puts 'generating meals'
  20.times do
    Meal.create(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    price: Faker::Commerce.price,
    image_url: Faker::LoremFlickr.image,
    category_id: Faker::Number.between(from: 1, to: 5)
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

  # # Create category meals
  # puts 'generating category meals'
  # Category.all.each do |category|
  #   category.meals << Meal.order("RANDOM()").first(3)
  # end

  # Create orders
  puts 'generating orders'
  10.times do
    Order.create(
      total_prize: Faker::Commerce.price,
      status: Faker::Boolean.boolean,
      order_id: Faker::Number.number(digits: 8),
      user_id: Faker::Number.between(from: 1, to: 5)
    )
  end

  # Create order histories
  puts 'generating order histories'
  Order.all.each do |order|
    OrderHistory.create(
      order_id: order.id,
      meal_id: Meal.order("RANDOM()").first.id
    )
  end
  puts 'done'

  # Create meals of the day
  puts 'generating meals of the day'
  7.times do
    meal = Meal.all.sample
    MealOfTheDay.create(
      meal_id: meal.id,
      expires_at: Faker::Time.between(from: DateTime.now, to: DateTime.now + 7.days)
    )
  end

end

seed_database
