class DrinkSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :description, :price
end
