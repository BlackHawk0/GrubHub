class OrderHistoriesController < ApplicationController
    
    def index
        orders = current_user.orders.where.not(status: 'pending')
        render json: orders, status: 200
    end

    def sales
    end
end
