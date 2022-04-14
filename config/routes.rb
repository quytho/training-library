Rails.application.routes.draw do
  root 'users#index'
  resources :publishers
  resources :books
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :authors
end
