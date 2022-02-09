Rails.application.routes.draw do

  root 'pages#home'

  resources :users, except: [:new, :create]
  get 'new', to: 'users#new'
  post 'new', to: 'users#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destoy'
  
end
