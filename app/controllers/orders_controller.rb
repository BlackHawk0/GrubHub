class OrdersController < ApplicationController
    before_action :authorize_customer, only: [:create]

    def index
        orders = current_user.orders.where(status: 'pending')
        render json: orders, status: :ok
    end

    # POST /orders
    def create 
        user = User.find(params[:user_id])
        items = params[:items]
        orders = items.map do |item|
            Order.create!(user: user, order_id: generate_order_id, meal_id: item[:id], quantity: item[:quantity], total_price: item[:itemTotal], status: item[:status])
        end
        render json: orders, status: :created
    end


    private
    def authorize_customer
        render json: { error: 'Not Authorized' }, status: :unprocessable_entity unless current_user.role == 'customer'
    end

    # def order_params
    #     params.require(:order).permit(:total_prize, :status)
    # end

    def generate_order_id
      loop do
          order_id = SecureRandom.hex(6) # generates a random string of hexadecimal characters
          break order_id unless Order.exists?(order_id: order_id) # check if the generated order ID is already in use
      end
    end

   

end
