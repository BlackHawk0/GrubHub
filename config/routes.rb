Rails.application.routes.draw do
  resources :mpesas
  # create a user
  post 'register', to: 'users#create'
  post 'login', to: 'auth#create'
  get 'profile', to: 'users#profile'

  # add to meals of the day
  post 'favourites', to: 'meals_of_the_days#create'

  # get meals of the day
  get 'favourites', to: 'meals_of_the_days#favourite'

  # mpesa payment
  post "/stkpush", to: "mpesas#stkpush"
  post "/stkquery", to: "mpesas#stkquery"

  # meals
  resources :meals
  
  # Categories
  resources :categories

  # Category Meals
  resources :category_meals, only: [:index, :create, :update, :destroy]

    # Orders
  resources :orders, only: [:index, :show, :create]

  # order histories for a user
  get 'history', to:"order_histories#index"


  
  
end
