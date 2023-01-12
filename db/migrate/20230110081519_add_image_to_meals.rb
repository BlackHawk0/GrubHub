class AddImageToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :image_url, :string
  end
end
