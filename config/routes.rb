Rails.application.routes.draw do

  root 'pages#home'

  resources :users
  get 'signup', to: 'users#new'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'
  
end
