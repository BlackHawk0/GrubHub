Rails.application.routes.draw do
  post 'register', to: 'users#create'
  post 'login', to: 'auth#create'
  get 'profile', to: 'users#profile'

  # drinks resources
  resources :drinks, only: [:create, :index, :show, :update, :destroy]
end
