class Drink < ApplicationRecord
  has_many :category_meals
  has_many :categories, through: :category_meals
end
