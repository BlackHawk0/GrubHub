Rails.application.routes.draw do
  post 'register', to: 'users#create'
  post 'login', to: 'auth#create'
  get 'profile', to: 'users#profile'
end
