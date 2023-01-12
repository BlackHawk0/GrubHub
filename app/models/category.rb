class Category < ApplicationRecord
    validates :name, presence: true
    validates :image_url, presence: true
    has_many :category_meals
    has_many :meals, through: :category_meals
end
