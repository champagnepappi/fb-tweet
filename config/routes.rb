Rails.application.routes.draw do


  root 'pages#home'

  resources :users

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  
end
