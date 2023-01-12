class Category < ApplicationRecord
    has_many :category_meals, dependent: :destroy

    validates :name, presence: true
    validates :image_url, presence: true
    has_many :category_meals

    has_many :meals, through: :category_meals
end
