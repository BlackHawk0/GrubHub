class UsersController < ApplicationController
    before_action :authorized, except: [:create]
    # skip_before_action :authorized, only: [:create]

    # POST /register
    def create
        user = User.create(user_params)
        if user.valid?
            # issue token to user if they are valid
            token = encode_token(user_id: user.id)
            render json: {user: user, jwt: token}, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
# changed the status code from :authorized to :accepted....and also method from profle to profile
    def profile
        render json: {user: current_user}, status: :accepted
    end

    private
    def user_params
        params.permit(:email, :username, :password)
    end
end
