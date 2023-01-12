Rails.application.routes.draw do
  # create a user
  post 'register', to: 'users#create'
  post 'login', to: 'auth#create'
  get 'profile', to: 'users#profile'

  # add to meals of the day
  post 'favourites', to: 'meals_of_the_days#create'

  # get meals of the day
  get 'favourites', to: 'meals_of_the_days#favourite'

  # meals
  resources :meals
  
  # Categories
  resources :categories

  # Category Meals
  resources :category_meals, only: [:create, :update, :destroy]

    # Orders
  resources :orders, only: [:index, :show, :create]

  # order histories for a user
  get 'orders/history', to:"order_histories#index"


  
  
end
