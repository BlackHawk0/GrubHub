class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :image_url
end
