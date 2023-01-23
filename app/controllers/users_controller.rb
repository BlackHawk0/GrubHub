class UsersController < ApplicationController
    before_action :authorized, except: [:create]
    # skip_before_action :authorized, only: [:create]

    # POST /register
    def create
        user = User.create!(user_params)
        if user.valid?
            # issue token to user if they are valid
            token = encode_token(user_id: user.id)

            # Send welcome email using SendGrid
            send_welcome_email(user)

            render json: {user: user, jwt: token}, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def profile
        render json: {user: current_user}, status: :accepted
    end

    private
    def user_params
        params.permit(:email, :username, :password, :role)
    end
    def send_welcome_email(user)
        # Set up SendGrid client
        sg = SendGrid::API.new(api_key: ENV['send_grid_api'])

        # Create email content
        from = SendGrid::Email.new(email: 'ngoyadaniel4@gmail.com')
        to = SendGrid::Email.new(email: user.email)
        subject = 'Welcome to Our App'
        content = SendGrid::Content.new(type: 'text/plain', value: "Dear #{user.username}, thank you for signing up for our app. We're excited to have you on board!")

        # Create mail object
        mail = SendGrid::Mail.new(from, subject, to, content)

        # Send email
        response = sg.client.mail._('send').post(request_body: mail.to_json)

        # Check for success
        if response.status_code == 200
            puts "Welcome email sent successfully to #{user.email}"
        elsif response.status_code == 202
            puts "Welcome email request accepted for processing to #{user.email}"
        else
            puts "Failed to send welcome email to #{user.email}"
        end
    end
end
