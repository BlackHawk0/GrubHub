class Meal < ApplicationRecord
    has_many :category_meals
    has_many :categories, through: :category_meals
    has_many :order_histories
    has_many :orders, through: :order_histories
end
