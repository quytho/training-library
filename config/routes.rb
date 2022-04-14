Rails.application.routes.draw do
  root 'users#index'
  resources :publishers
  resources :books
  get 'signup' => 'users#new'
  resources :users
  resources :categories
end
