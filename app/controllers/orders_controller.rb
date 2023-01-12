class OrdersController < ApplicationController
    before_action :authorize_customer, only: [:create]

    def index
        orders = current_customer.orders.where(status: 'pending')
        render json: orders, status: :ok
    end

    # POST /orders
    def create 
        # byebug
        user = User.find(params[:user_id])
        # order = user.orders.create!(order_params)
        order = Order.create!(order_params.merge(user: user))
        order.order_id = order.generate_order_id
        render json: order, status: :created
    end

    private
    def authorize_customer
        render json: { error: 'Not Authorized' }, status: :unprocessable_entity unless current_user.role == 'customer'
    end

    def order_params
        params.require(:order).permit(:total_prize, :status)
    end

   

end
