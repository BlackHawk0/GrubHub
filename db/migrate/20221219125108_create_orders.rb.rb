class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :order_id
      t.integer :meal_id
      t.integer :quantity
      t.decimal :total_price
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
