class CategoryMealsController < ApplicationController
    # before_action :authorize_caterer, only: [:create, :update, :destroy]
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def create
        category_meal = CategoryMeal.create!(category_meal_params)
        render json: category_meal, status: :created
    end

    # def update
    #     category_meal = CategoryMeal.find(params[:id])
    #     category_meal.update!(category_meal_params)
    #     render json: category_meal, status: :ok
    # end

    # def destroy
    #     category_meal = CategoryMeal.find(params[:id])
    #     category_meal.destroy
    #     head :no_content
    # end

    # private

    # def authorize_caterer
    #     render json: { error: 'Not Authorized' }, status: :unprocessable_entity unless current_user.user_type == 'caterer'
    # end

    # def category_meal_params
    #     params.require(:category_meal).permit(:meal_id, :category_id)
    # end

    # def record_invalid(e)
    #     render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    # end

    # def record_not_found
    #     render json: {errors: ['Record not found']}, status: :not_found
    # end

end
