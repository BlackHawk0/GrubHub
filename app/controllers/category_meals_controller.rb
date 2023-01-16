class CategoryMealsController < ApplicationController
    before_action :authorize_caterer, only: [:create, :update, :destroy]


    def index
        category_meal = CategoryMeal.all
        render json: category_meal, status: :ok
    end
    
    # POST /category_meal
    def create
        category_meal = CategoryMeal.create!(category_meal_params)
        render json: category_meal, status: :created
    end

    # PATCH/PUT /category_meal/1
    def update
        category_meal = CategoryMeal.find(params[:id])
        category_meal.update!(category_meal_params)
        render json: category_meal, status: :ok
    end

    # DELETE /category_meal/1
    def destroy
        category_meal = CategoryMeal.find(params[:id])
        category_meal.destroy
        head :no_content
    end

    private

    def authorize_caterer
        render json: { error: 'Not Authorized' }, status: :unprocessable_entity unless current_user.user_type == 'caterer'
    end

    def category_meal_params
        params.require(:category_meal).permit(:meal_id, :category_id)
    end

end
