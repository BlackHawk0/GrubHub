class CreateOrderHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :order_histories do |t|
      t.references :order, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
