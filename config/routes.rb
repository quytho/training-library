Rails.application.routes.draw do
  root 'users#index'
  resources :books
  get 'signup' => 'users#new'
  resources :users
  resources :authors
  namespace :admin do
    resources :publishers
    resources :books
    resources :authors
    resources :categories
  end
end
