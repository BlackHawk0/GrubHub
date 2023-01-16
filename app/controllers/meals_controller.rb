class MealsController < ApplicationController
    before_action :authorize_caterer, only: [:create, :update, :destroy]

    # GET /meals
    def index
        meals = Meal.all
        render json: meals, status: :ok
    end

    # GET /meals/:id
    def show
        meal = Meal.find(params[:id])
        render json: meal, status: :ok
    end

    # POST /meals
    def create
        meal = Meal.create!(meal_params)
        render json: meal, status: :created
    end

    # PATCH /meals/:id
    def update
        meal = Meal.find(params[:id])
        meal.update!(meal_params)
        render json: meal, status: :ok
    end

    # DELETE /meals/id
    def destroy
        meal = Meal.find(params[:id])
        meal.destroy
        render json: {message: "Meal Deleted"}
        # head :no_content
    end 
    

    private

    def meal_params
        params.permit(:name, :description, :price, :image_url, :category_id)
    end

    def record_invalid(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

   
end
