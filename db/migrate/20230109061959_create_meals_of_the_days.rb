class CreateMealsOfTheDays < ActiveRecord::Migration[7.0]
  def change
    create_table :meals_of_the_days do |t|
      t.integer :meal_id, null: false
      t.datetime :expires_at, null: false
      t.timestamps
    end
  end
end
