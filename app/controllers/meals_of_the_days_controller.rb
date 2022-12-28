class MealsOfTheDaysController < ApplicationController
    # POST /meals_of_the_day
    def create
        meal = Meal.create!(meal_params)
        MealsOfTheDay.create!(meal: meal)
        MealOfTheDayCleanupJob.set(wait_until: Date.tomorrow.morning).perform_later
    end
end
