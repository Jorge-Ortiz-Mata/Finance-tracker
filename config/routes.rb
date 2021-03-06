Rails.application.routes.draw do

  resources :friendships, only: [:destroy]
  get 'friendships', to: 'friendships#index'
  get 'user_friends', to: 'friendships#create'
  get 'friendships/:id', to: 'friendships#destroy'

  resources :user_stocks, only: [:destroy]
  get 'user_stocks', to: 'user_stocks#create'  
  get '/user_stocks/:id', to: 'user_stocks#destroy'
  get 'search_friend', to: 'users#search_friend'

  root 'pages#home'

  resources :users
  get 'signup', to: 'users#new'
  get '/myportfolio', to: 'users#my_portfolio'
  
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'
  
  get 'search_stock', to: 'stocks#search'

  
end
