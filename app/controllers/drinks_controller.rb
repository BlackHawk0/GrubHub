class DrinksController < ApplicationController

  def index
   drinks = Drink.all
    render json: drinks, status: :ok
  end

  def create
    drink = Drink.create!(drink_params)
    render json: drink, status: :created
  end
  def show
    drink = Drink.find(params[:id])
    render json: drink, status: :ok
  end
  def update
    drink = Drink.find(params[:id])
    drink.update!(drink_params)
    render json: drink, status: :ok
  end
  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    head :no_content
  end

  private
  def drink_params
    params.permit(:name, :image_url, :description, :price)
  end

end
