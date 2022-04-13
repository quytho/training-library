Rails.application.routes.draw do
  root 'users#index'
  resources :books
  get 'signup' => 'users#new'
  get 'author' => 'authors#index'
  resources :users
  resources :authors
end
