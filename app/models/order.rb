class Order < ApplicationRecord
  belongs_to :user
  has_many :order_histories
  has_many :meals, through: :order_histories

  validates :quantity, presence: true
  validates :total_price, presence: true
  validates :order_id, presence: true
end
