Rails.application.routes.draw do
  root 'users#index'
  resources :publishers
  resources :books
  get 'signup' => 'users#new'
  get 'index_category' => 'categories#index'
  resources :users
  resources :categories
end
