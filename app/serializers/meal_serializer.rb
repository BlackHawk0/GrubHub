class MealSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :image_url
end
