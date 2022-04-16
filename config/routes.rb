Rails.application.routes.draw do
  root 'users#index'
  resources :books
  namespace :admin do
    resources :publishers
  end
end
