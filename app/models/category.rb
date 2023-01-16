class Category < ApplicationRecord
    validates :name, presence: true
    validates :image_url, presence: true
    has_many :meals
end
