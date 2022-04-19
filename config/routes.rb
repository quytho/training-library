Rails.application.routes.draw do
  root 'users#index'
  resources :books
  get 'signup' => 'users#new'
  resources :users
  namespace :admin do
    resources :categories
  resources :authors
  namespace :admin do
    resources :publishers
  end
end
