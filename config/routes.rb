Rails.application.routes.draw do
  post 'register', to: 'users#create'
  post 'login', to: 'auth#create'
  get 'profile', to: 'users#profile'

  # meals
  resources :meals
  
  # Categories
  resources :categories

  # Category Meals
  resources :category_meals, only: [:create, :update, :destroy]

    # Orders
  resources :orders, only: [:index, :show, :create]

  # order histories
  get 'orders/history', to:"order_histories#index"
  
end
