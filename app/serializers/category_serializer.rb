class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url
  has_many :meals
end
