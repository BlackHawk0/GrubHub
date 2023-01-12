class CategoryMeal < ApplicationRecord
    belongs_to :category
    belongs_to :meal
end
