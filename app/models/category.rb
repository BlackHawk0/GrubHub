class Category < ApplicationRecord
    has_many :category_meals
    has_many :meals, through: :category_meals
end
