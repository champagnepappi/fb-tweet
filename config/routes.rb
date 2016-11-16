Rails.application.routes.draw do


  root 'pages#home'

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :account_activations, only: [:edit]
end
