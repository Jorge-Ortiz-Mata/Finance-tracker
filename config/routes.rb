Rails.application.routes.draw do
  resources :user_stocks, only: [:destroy]
  get 'user_stocks', to: 'user_stocks#create'  
  get '/user_stocks/:id', to: 'user_stocks#destroy'

  root 'pages#home'

  resources :users
  get 'signup', to: 'users#new'
  get '/myportfolio', to: 'users#my_portfolio'
  
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'
  
  get 'search_stock', to: 'stocks#search'
  
end
