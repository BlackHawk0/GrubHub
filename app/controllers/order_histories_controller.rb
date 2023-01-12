class OrderHistoriesController < ApplicationController

    # Get all orders that have been placed by the current user
    def index
        orders = current_user.orders.where.not(status: 'pending')
        render json: orders, status: :ok
    end

    # def history
    #     orders = OrderHistory.all
    #     render json: orders, status: :ok
    # end

end
