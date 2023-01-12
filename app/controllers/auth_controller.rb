class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    # POST /login
    def create
        user = User.find_by(username: login_params[:username])
        # authenticate user with both username and password
        if user && user.authenticate(login_params[:password])
            token = encode_token(user_id: user.id)
            render json: {user: user, jwt: token}, status: :accepted
        else
            render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private
    def login_params
        # params.require(:user).permit(:username, :password)
        params.permit(:username, :password)
    end
end
