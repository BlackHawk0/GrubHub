class DropCategoryMeals < ActiveRecord::Migration[7.0]
  def change
    drop_table :category_meals
  end
end
