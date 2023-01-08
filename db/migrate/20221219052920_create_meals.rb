class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
