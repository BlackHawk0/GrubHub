class AddCategoryIdToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :category_id, :string
  end
end
