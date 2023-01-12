class MealOfTheDayCleanupJob < ApplicationJob
  queue_as :default

  def perform
    meals_of_the_day = MealsOfTheDay.where("expires_at <= ?", Time.current)
    meals_of_the_day.destroy_all
  end
end
