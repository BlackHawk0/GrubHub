source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby "3.0.4"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.12'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

gem 'jwt', '~> 2.5'

gem 'active_model_serializers', '~> 0.10.13'

gem 'faker', '~> 3.0'
gem 'byebug', '~> 11.1', '>= 11.1.3'
gem 'securerandom', '~> 0.2.2'
gem 'activejob'
gem 'rest-client'
gem "sidekiq"
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
group :test do
  gem 'shoulda-matchers'
end


gem "rspec", "~> 3.12"
gem 'sendgrid-ruby'
gem 'actionmailer', '~> 7.0', '>= 7.0.4'
gem 'dotenv', '~> 2.8', '>= 2.8.1'
gem 'figaro'
