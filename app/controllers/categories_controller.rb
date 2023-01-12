class CategoriesController < ApplicationController
    before_action :authorize_caterer, only: [:create, :update, :destroy]


    # GET /categories
    def index
        categories = Category.all
        render json: categories, status: :ok
    end

    # GET /categories/1
    def show
        category = Category.find(params[:id])
        render json: category, status: :ok
    end

    # POST /categories
    def create
        category = Category.create!(category_params)
        render json: category, status: :created
    end

    # PUT /categories/1
    def update
        category = Category.find(params[:id])
        category.update!(category_params)
        render json: category, status: :accepted
    end

    # DELETE /categories/1
    def destroy
        category = Category.find(params[:id])
        category.destroy
        render json: category, status: :no_content
        head :no_content
    end
    
    private

    def category_params
        params.params(:name, :image_url)
    end

    def authorize_caterer
        render json: { error: 'Not Authorized' }, status: unprocessable_entity unless current_user.user_type == 'caterer'
    end
end
