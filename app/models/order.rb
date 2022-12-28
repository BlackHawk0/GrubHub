class Order < ApplicationRecord
  belongs_to :user
  has_many :order_histories
  has_many :meals, through: :order_histories

  def generate_order_id
      loop do
          order_id = SecureRandom.hex(3) # generates a random string of hexadecimal characters
          break order_id unless Order.exists?(order_id: order_id) # check if the generated order ID is already in use
      end
  end
end
