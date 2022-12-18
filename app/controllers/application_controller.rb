class ApplicationController < ActionController::API
    before_action :authorized

    SECRET = 's3cr3t'

    def encode_token(payload)
        JWT.encode(payload, SECRET)
    end

    def authentication
        request.headers['Authorization']
    end

    def decoded_token
        if authentication
            token = authentication.split(' ')[1]
            begin
                JWT.decode(token, SECRET, true, { algorithm: 'HS256' })
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            User.find(user_id)
        end
    end

    def logged_in?
        # current_user.present?
        !!current_user
    end

    def authorized
        render json: { message: "Please log in"}, status: :unauthorized unless logged_in?
    end

end
