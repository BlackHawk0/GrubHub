class CreateDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :drinks do |t|
      t.string :image_url
      t.string :description
      t.string :price

      t.timestamps
    end
  end
end
