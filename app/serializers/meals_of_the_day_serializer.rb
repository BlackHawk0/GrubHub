class MealsOfTheDaySerializer < ActiveModel::Serializer
  belongs_to :meal
  attributes :meal_id
end
