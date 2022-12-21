class CreateCategoryMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :category_meals do |t|
      t.integer :category_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
