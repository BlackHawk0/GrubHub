class Order < ApplicationRecord
  belongs_to :user
  has_many :order_histories
  has_many :meals, through: :order_histories
end
