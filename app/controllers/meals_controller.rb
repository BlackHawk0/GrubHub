class MealsController < ApplicationController
    before_action :authorize_caterer, only: [:create, :update, :destroy]
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    # GET /meals
    def index
        meals = Meal.all
        render json: meal, status: :ok
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

    # # DELETE /meals/id
    # def destroy
    #     meal = Meal.find(params[:id])
    #     meal.destroy
    #     render json: restaurant
    #     head :no_content
    # end

    private

    def meal_params
        params.permit(:name, :description, :price)
    end

    def record_invalid(e)
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found
        render json: {errors: ['Record not found']}, status: :not_found
    end

    def authorize_caterer
        render json: { error: 'Not Authorized' }, status: 401 unless current_user.user_type == 'caterer'
    end

end
