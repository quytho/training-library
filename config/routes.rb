Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'users#index'
  resources :books
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :authors
  namespace :admin do
    resources :publishers
    resources :authors
    resources :categories
    resources :books
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
