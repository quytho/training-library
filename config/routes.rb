Rails.application.routes.draw do
  root 'users#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :authors
  resources :books
  namespace :admin do
    resources :publishers
    resources :authors
    resources :categories
  end
end
