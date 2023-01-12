class MealsOfTheDaysController < ApplicationController
    # POST /favourites
    def create
        # meal = Meal.create!(meal_params)
        meal = MealsOfTheDay.create!(meal_params)
        MealOfTheDayCleanupJob.set(wait: 1.day).perform_later
        render json: meal, status: :created
    end

    # GET /favourites
    def favourite
        meal = MealsOfTheDay.all
        render json: meal, status: :ok
    end

    private
    def meal_params
        params.permit(:meal_id, :expires_at)
    end
end
