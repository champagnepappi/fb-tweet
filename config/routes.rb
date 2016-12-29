Rails.application.routes.draw do


  get 'password_resets/new'

  get 'password_resets/edit'

  root 'pages#home'

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
