Rails.application.routes.draw do
  root 'users#index'
  resources :books
  get 'signup' => 'users#new'
  resources :users
end
