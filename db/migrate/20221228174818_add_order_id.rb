class AddOrderId < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_id, :string
  end
end
