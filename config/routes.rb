Rails.application.routes.draw do

  get 'sessions/new'

  root 'pages#home'

  resources :users
end
